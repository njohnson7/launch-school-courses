require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'

require 'awesome_print'
require 'yaml'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

helpers do
  def extract_and_format_msg!
    session.delete(:msg)&.sub(/\A(.+)\z/, '<p>\1</p>')
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
    else
      headers['Content-Type'] = 'text/plain'
      content
    end
  end
end

def data_path
  # return File.expand_path('../test/data', __FILE__) if ENV['RACK_ENV'] == 'test'
  # File.expand_path('../data', __FILE__)
  File.expand_path(File.join('..', ENV['RACK_ENV'].to_s, 'data'), __FILE__)
end

def create_document(name, content = '')
  File.write(File.join(data_path, name), content)
end

# index
get '/' do
  pattern = File.join(data_path, '*')
  @files = Dir.glob(pattern).map { |path| File.basename(path) }
  erb :index
end

# create a new document
get '/new' do
  erb :new
end


post '/create' do
  filename = params[:filename].to_s.strip
  if filename.empty?
    session[:msg] = 'A name is required.'
    status 422
    erb :new
  else
    filename << '.txt' unless filename.match?(/\..+\z/)
    create_document filename
    session[:msg] = "#{filename} has been created."
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
  filename = params[:filename]
  file_path = File.join(data_path, filename)

  File.delete(file_path)

  session[:msg] = "#{filename} was deleted."
  redirect '/'
end

# update document
post '/:filename' do
  filename = params[:filename].to_s
  file_path = File.join(data_path, filename)

  new_content = params[:content]
  File.write(file_path, new_content)

  session[:msg] = "#{filename} has been updated."
  redirect '/'
end

get '/test/t' do
  erb :content
end

#   send_file file_path, type: :txt
