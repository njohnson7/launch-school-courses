require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'awesome_print'
require 'psych'

configure  do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  @title = 'Rock Paper Scissors'
end

get '/' do
  erb :rps
end

post '/choice' do
  user_choice = params[:choice]
  comp_choice = %w[rock paper scissors].sample

  session[:result] =
    if comp_choice == user_choice
      "You both picked #{user_choice} so it's a tie!"
    elsif comp_choice == 'rock' && user_choice == 'paper' || comp_choice == 'paper' && user_choice == 'scissors' || comp_choice == 'scissors' && user_choice == 'rock'
      "Computer picked #{comp_choice} and you picked #{user_choice}, so you win!"
    else
      "Computer picked #{comp_choice} and you picked #{user_choice}, so you lose!"
    end

  redirect '/'
end
