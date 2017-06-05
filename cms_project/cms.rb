require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'

require 'awesome_print'
require 'yaml'

ROOT = File.expand_path('..', __FILE__)

configure do
  enable :sessions
  set :session_secret, 'secret'
end

helpers do
  def extract_and_wrap_msg!
    session.delete(:msg)&.sub(/\A(.+)\z/, '<p>\1</p>')
  end

  def render_markdown(content)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(content)
  end

  def load_file_content(path)
    content = File.read(path)
    case File.extname(path)
    when '.txt'
      headers['Content-Type'] = 'text/plain'
      content
    when '.md'
      render_markdown(content)
    end
  end
end

before do
end

get '/' do
  @files = Dir.glob(File.join(ROOT, '/data/*')).map { |path| File.basename(path) }
  erb :index
end

get '/:filename' do
  filename = params[:filename].to_s
  file_path = File.join(ROOT, 'data', filename)

  if File.file?(file_path)
    load_file_content(file_path)
  else
    session[:msg] = "#{filename} does not exist."
    redirect '/'
  end
end

get '/test/t' do
  session[:test] = 'test123'
end

get'/aaa/:omg' do
  params[:omg]
end





#   send_file file_path, type: :txt
