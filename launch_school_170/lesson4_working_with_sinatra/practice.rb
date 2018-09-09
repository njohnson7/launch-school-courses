require 'sinatra'

get '/' do
  'Hello world!'
end

get '/advice' do
  'ADVICE!'
end

get 'hello/:name' do |n|
  "Hello #{n}!"
end

get 'say/*/to/*' do
  params['splat']
end

class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end
end

get('/stream') { Stream.new }

get '/template' do
  erb "<%= Time.now %>"
end

get '/haml' do
  @foo = 123
  haml  "%div.title Hello World #{@foo}"
end

template :layout do
  "%html\n =yield\n"
end

template :index do
  '%div.title index!'
end

get '/haml/index' do
  haml :index
end

get '/foo' do
  status 418
  headers \
    "Allow"   => "BREW, POST, GET, PROPFIND, WHEN",
    "Refresh" => "Refresh: 20; http://www.ietf.org/rfc/rfc2324.txt"
  body "I'm a tea pot!"
end

get '/stream2' do
  stream do |out|
    out << "It's gonna be legen -\n"
    sleep 0.5
    out << " (wait for it) \n"
    sleep 1
    out << "- dary!\n"
  end
end

get '/redirect' do
  redirect to('/haml')
end

get '/file' do
  send_file 'practice.rb'
end

get '/attach' do
  attachment 'practice.rb'
  'store it!'
end