require 'sinatra'

# get '/' do
#   'Hello, world!'
# end

get '/' do
  "Hello World #{params[:name]}".strip
end
