# rock_paper_scissors_practice.rb
# frozen_string_literal: true

VALID_CHOICES = %w(rock paper scissors)

def prompt(msg)
  puts "=> #{msg}"
end

def gets_user_choice
  user_choice = ''

  loop do
    prompt "Please choose one: #{VALID_CHOICES.join(', ')}"
    user_choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(user_choice)
    prompt "Invalid choice. Please try again."
  end

  user_choice
end

def win?(comp_choice, user_choice)
  (comp_choice == 'rock' && user_choice == 'paper') ||
    (comp_choice == 'paper' && user_choice == 'scissors') ||
    (comp_choice == 'scissors' && user_choice == 'rock')
end

def match_result(comp_choice, user_choice)
  if comp_choice == user_choice then 'tie'
  elsif win?(comp_choice, user_choice) then 'win'
  else 'lose'
  end
end

def outcome_msg(comp_choice, user_choice)
  return "#{user_choice.capitalize} doesn't affect #{comp_choice}" if comp_choice == user_choice

  choices = comp_choice, user_choice

  if choices.include?('rock') && choices.include?('scissors') then 'Rock smashes scissors'
  elsif choices.include?('rock') && choices.include?('paper') then 'Paper covers rock'
  else 'Scissors cuts paper'
  end
end

prompt 'Welcome to Rock Paper Scissors!'
prompt "---------------------------------"
puts

loop do
  user_choice = gets_user_choice
  puts

  comp_choice = VALID_CHOICES.sample

  result = match_result(comp_choice, user_choice)

  prompt "You chose #{user_choice} and the computer chose #{comp_choice}."
  prompt "#{outcome_msg(comp_choice, user_choice)}, so you #{result}#{result == 'win' ? '!' : '.'}"
  puts

  prompt 'Would you like to play again? (y/n)'
  again = gets.chomp.downcase
  puts

  break unless again.start_with?('y')
end

prompt 'Thank you for playing Rock Paper Scissors. Goodbye!'
