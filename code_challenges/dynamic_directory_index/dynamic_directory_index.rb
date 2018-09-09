require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @files = Dir.glob('public/*').map { |file| File.basename(file) }.sort
  if params['sort'] == 'descending'
    @files = @files.reverse
    @sort_link = 'ascending'
  else
    @sort_link = 'descending'
  end
  erb :index
end
