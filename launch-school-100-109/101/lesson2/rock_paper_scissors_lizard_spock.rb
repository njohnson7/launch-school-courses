# rock_paper_scissors_lizard_spock.rb
# frozen_string_literal: true

CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard',
            'k' => 'Spock' }.freeze
PROGRAM_NAME = CHOICES.values.map(&:capitalize).join(' ').freeze
WINNING_CONDITIONS = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock Spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(paper Spock),
  'Spock' => %w(rock scissors)
}.freeze

OUTCOME_MSGS = {
  %w(rock scissors) => 'Rock smashes scissors',
  %w(lizard rock) => 'Rock smashes lizard',
  %w(paper rock) => 'Paper covers rock',
  %w(Spock rock) => 'Spock vaporizes rock',
  %w(Spock paper) => 'Paper disproves Spock',
  %w(paper scissors) => 'Scissors cuts paper',
  %w(lizard paper) => 'Lizard eats paper',
  %w(lizard scissors) => 'Scissors decapitates lizard',
  %w(Spock scissors) => 'Spock smashes scissors',
  %w(Spock lizard) => 'Lizard poisons Spock'
}.freeze

POINTS_TO_WIN = 5

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def gets_user_choice
  prompt 'Please make a selection:'
  CHOICES.each { |letter, word| puts "   - '#{letter}' for #{word}" }

  loop do
    user_choice = gets.chomp.downcase
    return CHOICES[user_choice] if CHOICES.key?(user_choice)
    prompt "Invalid choice. Please choose one of the following letters:" \
           " #{CHOICES.keys.join(', ')}"
  end
end

def win?(comp_choice, user_choice)
  WINNING_CONDITIONS[user_choice].include?(comp_choice)
end

def win_lose_tie(comp_choice, user_choice)
  if comp_choice == user_choice then 'tie'
  elsif win?(comp_choice, user_choice) then 'win'
  else 'lose'
  end
end

def outcome_msg(comp_choice, user_choice)
  return "You both picked #{comp_choice}" if comp_choice == user_choice

  choices = [comp_choice, user_choice].sort

  OUTCOME_MSGS[choices]
end

def count_points(points, result)
  if result == 'win' then points[:user] += 1
  elsif result == 'lose' then points[:comp] += 1
  end
end

def display_welcome_msg
  prompt "Welcome to #{PROGRAM_NAME}!".center(60)
  prompt '------------------------------------------------------'.center(60)
  puts
  puts
end

def display_match_start(match_number)
  prompt "Match #{match_number}".center(40)
  prompt "-------------------------------------"
  prompt "The first one to reach #{POINTS_TO_WIN} points wins!"
  puts
end

def round(round_number, points)
  prompt "Round #{round_number}!"

  user_choice = gets_user_choice
  comp_choice = CHOICES.values.sample
  result = win_lose_tie(comp_choice, user_choice)

  count_points(points, result)

  clear_screen

  display_round_result(round_number, user_choice, comp_choice, result, points)
end

def display_round_result(round_number, user_choice, comp_choice, result, points)
  prompt "ROUND #{round_number} RESULTS".center(40)
  prompt "Your choice:              #{user_choice}"
  prompt "Computer's choice:        #{comp_choice}"
  prompt "  #{outcome_msg(comp_choice, user_choice)}, so you #{result}" \
         " this round#{result == 'win' ? '!' : '.'}"
  prompt "Your total points:        #{points[:user]} of #{POINTS_TO_WIN}"
  prompt "Computer's total points:  #{points[:comp]} of #{POINTS_TO_WIN}"
  puts
end

def play_again
  puts
  prompt "Would you like to play again? ('y' for yes)"
  again = gets.chomp.downcase
  puts

  again
end

display_welcome_msg

match_number = 0
loop do
  match_number += 1
  points = { comp: 0, user: 0 }

  display_match_start(match_number)

  round_number = 0
  loop do
    round_number += 1

    round(round_number, points)

    if points[:user] == POINTS_TO_WIN
      prompt "Congratulations, you have won Match #{match_number}!"
      break
    elsif points[:comp] == POINTS_TO_WIN
      prompt "Sorry, the computer has won Match #{match_number}."
      break
    end
  end

  again = play_again
  break unless again.start_with?('y')

  clear_screen
end

prompt "Thank you for playing #{PROGRAM_NAME}. Goodbye!"
