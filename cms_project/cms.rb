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
    # @filename = File.basename(path)
    # erb :image
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

# index
get '/' do
  @files = list_files
  erb :index
end

# create a new document
get '/new' do
  require_signed_in_user
  erb :new
end

post '/create' do
  require_signed_in_user

  filename = params[:filename].to_s.strip
  if filename.empty?
    status 422
    session[:msg] = 'A name is required.'
    erb :new
  elsif invalid_extension?(filename)
    status 422
    session[:msg] = "Filename must end with: #{VALID_EXTENSIONS.join(', ')}"
    erb :new
  elsif list_files.include?(filename)
    status 422
    session[:msg] = 'File already exists.'
    erb :new
  else
    create_document filename
    session[:msg] = "#{filename} has been created."
    redirect '/'
  end
end

# upload file
post '/upload' do
  file_hash = params[:file]
  filename = file_hash&.[](:filename).to_s.strip

  if filename.empty?
    status 422
    session[:msg] = 'Filename cannot be empty.'
    erb :new
  elsif list_files.include?(filename)
    status 422
    session[:msg] = 'File already exists.'
    erb :new
  else
    file = params[:file][:tempfile]
    File.open(File.join(data_path, filename), 'wb') { |f| f.write(file.read) }
    session[:msg] = "#{filename} has been uploaded."
    redirect '/'
  end
end

# display document
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

# edit document
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

# delete document
post '/:filename/delete' do
  require_signed_in_user

  filename = params[:filename]
  file_path = File.join(data_path, filename)

  File.delete(file_path)

  session[:msg] = "#{filename} was deleted."
  redirect '/'
end

# update document
post '/:filename' do
  require_signed_in_user

  old_filename = params[:filename].to_s
  old_file_path = File.join(data_path, old_filename)
  old_content = File.read(old_file_path)


  new_filename = next_filename(old_filename)
  new_file_path = File.join(data_path, new_filename)
  new_content = params[:content]

  create_document new_filename, new_content

  session[:msg] = "#{old_filename} has been updated => #{new_filename}"
  redirect '/'
end

# view sign in page
get '/users/signin' do
  erb :signin
end

# sign in
post '/users/signin' do
  username = params[:username]

  if valid_credentials?(username, params[:password])
    session[:username] = username
    session[:msg] = "Welcome #{username}!"
    redirect '/'
  else
    session[:msg] = 'Invalid credentials.'
    status 422
    erb :signin
  end
end

# sign out
post '/users/signout' do
  session.delete(:username)
  session[:msg] = 'You have been signed out.'
  redirect '/'
end

# duplicate document
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

# view sign up page
get '/users/signup' do
  erb :signup
end

# sign up
post '/users/signup' do
  username = params[:username].to_s.strip
  password = params[:password].to_s
  if username.empty?
    status 422
    session[:msg] = 'Username cannot be empty.'
    erb :signup
  elsif password.empty?
    status 422
    session[:msg] = 'Password cannot be empty.'
    erb :signup
  elsif users.keys.include?(username)
    status 422
    session[:msg] = 'Username has already been taken.'
    erb :signup
  else
    encrypted_password = BCrypt::Password.create(password)
    File.open(users_file_path, 'a') { |file| file.puts "#{username}: #{encrypted_password}" }

    session[:username] = username
    session[:msg] = "Welcome #{username}! Your account has been created."
    redirect '/'
  end
end
