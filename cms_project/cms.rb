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

  def render_markdown(markdown)

  end
end

before do
  @files = Dir.glob(File.join(ROOT, '/data/*')).map { |path| File.basename(path) }
end

# after do

# end

get '/' do
  erb :index
end

get '/:filename' do
  filename = params[:filename]
  file_path = File.join(ROOT, 'data', filename.to_s)
  if File.file?(file_path)
    if File.extname(file_path) == '.md'
      # ;require'pry';binding.pry;
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      @content = markdown.render(File.read(file_path))
      # headers['Content-Type'] = 'text/plain'
      erb :markdown
    else
      send_file file_path, type: :txt
    end
  else
    session[:msg] = "#{filename} does not exist."
    redirect '/'
  end


  # headers['Content-Type'] = 'text/plain'
  # File.read(file_path)
end

get '/test/t' do
  session[:test] = 'test123'
end

# get '/:file' do
#   file = params[:file]
#   File.read()
# end
