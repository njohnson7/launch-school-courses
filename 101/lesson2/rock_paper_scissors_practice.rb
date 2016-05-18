# rock_paper_scissors_practice.rb
# frozen_string_literal: true

# the user makes a choice
# the computer makes a choice
# the winner is displayed

def prompt(msg)
  puts "=> #{msg}"
end

def comp_chooses
  case rand(3)
  when 0 then 'rock'
  when 1 then 'paper'
  else 'scissors'
  end
end

def win?(comp_choice, user_choice)
  (comp_choice == 'rock' && user_choice == 'paper') ||
    (comp_choice == 'paper' && user_choice == 'scissors') ||
    (comp_choice == 'scissors' && user_choice == 'rock')
end

def find_match_result(comp_choice, user_choice)
  return 'tie' if comp_choice == user_choice
  return 'win' if win?(comp_choice, user_choice)
  'lose'
end

def outcome_msg(comp_choice, user_choice)
  return "#{user_choice.capitalize} doesn't affect #{comp_choice}" if comp_choice == user_choice
  *choices = comp_choice, user_choice
  if choices.include?('rock') && choices.include?('scissors') then 'Rock smashes scissors'
  elsif choices.include?('rock') && choices.include?('paper') then 'Paper covers rock'
  else 'Scissors cuts paper'
  end
end

prompt 'Welcome to Rock Paper Scissors!'
prompt "---------------------------------"
puts

selection_prompt = <<~MSG
  Please make a selection:
    - 'rock'
    - 'paper'
    - 'scissors'
MSG

loop do
  prompt selection_prompt

  user_choice = ''
  loop do
    user_choice = gets.chomp.downcase
    break if %w(rock paper scissors).include?(user_choice)
    prompt "You must select either 'rock', 'paper', or 'scissors'."
  end
  puts

  comp_choice = comp_chooses
  result = find_match_result(comp_choice, user_choice)

  prompt "You chose #{user_choice} and the computer chose #{comp_choice}."
  prompt "#{outcome_msg(comp_choice, user_choice)}, so you #{result}#{result == 'win' ? '!' : '.'}"
  puts

  prompt "Would you like to play again? ('y' for yes)"
  continue = gets.chomp.downcase
  puts

  break unless continue == 'y'
end

prompt 'Thank you for playing Rock Paper Scissors. Goodbye!'
