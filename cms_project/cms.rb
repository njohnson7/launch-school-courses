require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'
require 'psych'
require 'bcrypt'
require 'awesome_print'

VALID_EXTENSIONS = %w[.txt .md]

configure do
  enable :sessions
  set :session_secret, 'secret'
end

def render_markdown(content)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(content)
end

def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when '.md'
    erb render_markdown(content)
  when '.txt'
    headers['Content-Type'] = 'text/plain'
    content
  else
    send_file path
  end
end

def data_path
  File.expand_path(File.join('..', ENV['RACK_ENV'].to_s, 'data'), __FILE__)
end

def create_document(name, content = '')
  File.write(File.join(data_path, name), content)
end

def user_signed_in?
  session.key?(:username)
end

def require_signed_in_user
  return if user_signed_in?
  session[:msg] = 'You must be signed in to do that.'
  redirect '/'
end

def users
  Psych.load_file(users_file_path)
end

def users_file_path
  File.expand_path(File.join('..', ENV['RACK_ENV'].to_s, 'users.yml'), __FILE__)
end

def valid_credentials?(username, password)
  users.key?(username) && BCrypt::Password.new(users[username]) == password
end

def invalid_extension?(filename)
  !VALID_EXTENSIONS.include?(File.extname(filename))
end

def next_filename(name)
  basename = File.basename(name, '.*')
  original_name, number = basename.split(/-(\d+)/)
  duplicate_names = list_files.select { |file| file =~ /#{original_name}/ }
  highest_duplicate_basename = duplicate_names.map { |file| File.basename(file, '.*') }.max
  number = highest_duplicate_basename[(/(?<=-)\d+\z/)]
  extname = File.extname(name)

  highest_duplicate_basename += '-1' unless number
  "#{highest_duplicate_basename.next}#{extname}"
end

def list_files
  pattern = File.join(data_path, '*')
  Dir.glob(pattern).map { |path| File.basename(path) }
end

def status_422_error(msg, template)
  status 422
  session[:msg] = msg
  erb template
end

def store_new_user_credentials(username, password)
   encrypted_password = BCrypt::Password.create(password)
   File.open(users_file_path, 'a') { |file| file.puts "#{username}: #{encrypted_password}" }
end

get '/' do
  @files = list_files
  erb :index
end

get '/new' do
  require_signed_in_user
  erb :new
end

post '/create' do
  require_signed_in_user

  filename = params[:filename].to_s.strip
  if filename.empty?
    status_422_error('A name is required.', :new)
  elsif invalid_extension?(filename)
    status_422_error("Filename must end with: #{VALID_EXTENSIONS.join(', ')}", :new)
  elsif list_files.include?(filename)
    status_422_error('File already exists.', :new)
  else
    create_document(filename)
    session[:msg] = "#{filename} has been created."
    redirect '/'
  end
end

post '/upload' do
  file_hash = params[:file]
  filename = file_hash&.[](:filename).to_s.strip

  if filename.empty?
    status_422_error('Filename cannot be empty.', :new)
  elsif list_files.include?(filename)
    status_422_error('File already exists.', :new)
  else
    file = params[:file][:tempfile]
    File.open(File.join(data_path, filename), 'wb') { |f| f.write(file.read) }
    session[:msg] = "#{filename} has been uploaded."
    redirect '/'
  end
end

get '/:filename' do
  filename = params[:filename].to_s
  file_path = File.join(data_path, filename)

  if File.file?(file_path)
    load_file_content(file_path)
  else
    session[:msg] = "#{filename} does not exist."
    redirect '/'
  end
end

get '/:filename/edit' do
  require_signed_in_user

  @filename = params[:filename].to_s
  file_path = File.join(data_path, @filename)

  if File.file?(file_path)
    @content = File.read(file_path)
    erb :edit
  else
    session[:msg] = "#{@filename} does not exist."
    redirect '/'
  end
end

post '/:filename/delete' do
  require_signed_in_user

  filename = params[:filename]
  file_path = File.join(data_path, filename)

  File.delete(file_path)

  session[:msg] = "#{filename} was deleted."
  redirect '/'
end

post '/:filename' do
  require_signed_in_user

  old_filename = params[:filename].to_s
  old_file_path = File.join(data_path, old_filename)
  old_content = File.read(old_file_path)

  new_filename = next_filename(old_filename)
  new_file_path = File.join(data_path, new_filename)
  new_content = params[:content]

  create_document(new_filename, new_content)
  session[:msg] = "#{old_filename} has been updated => #{new_filename}"
  redirect '/'
end

get '/users/signin' do
  erb :signin
end

post '/users/signin' do
  username = params[:username]

  if valid_credentials?(username, params[:password])
    session[:username] = username
    session[:msg] = "Welcome #{username}!"
    redirect '/'
  else
    status_422_error('Invalid credentials.', :signin)
  end
end

post '/users/signout' do
  session.delete(:username)
  session[:msg] = 'You have been signed out.'
  redirect '/'
end

post '/:filename/duplicate' do
  require_signed_in_user

  filename = params[:filename]
  file_path = File.join(data_path, filename)
  new_filename = next_filename(filename)
  content = File.read(file_path)

  create_document(new_filename, content)
  session[:msg] = "#{filename} has been duplicated => #{new_filename}"
  redirect '/'
end

get '/users/signup' do
  erb :signup
end

post '/users/signup' do
  username = params[:username].to_s.strip
  password = params[:password].to_s

  if username.empty?
    status_422_error('Username cannot be empty.', :signup)
  elsif password.empty?
    status_422_error('Password cannot be empty.', :signup)
  elsif users.keys.include?(username)
    status_422_error('Username has already been taken.', :signup)
  else
    store_new_user_credentials(username, password)
    session[:username] = username
    session[:msg] = "Welcome #{username}! Your account has been created."
    redirect '/'
  end
end
