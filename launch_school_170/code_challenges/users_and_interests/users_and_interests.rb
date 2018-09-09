require 'yaml'
require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

before do
  @users = YAML.load_file('users.yaml')
  @names = @users.keys.map(&:to_s).sort
end

helpers do
  def count_interests
    @users.values.flat_map { |hsh| hsh[:interests] }.size
  end
end

get '/' do
  redirect '/users'
end

get '/users' do
  @title = 'Users'

  erb :home
end

get '/users/:name' do
  @name = params[:name]
  return 'Not found' unless @names.include?(@name)
  @title = @name
  @user = @users[@name.to_sym]


  erb :user
end
