# rock_paper_scissors_lizard_spock.rb
# frozen_string_literal: true

CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard',
            'k' => 'Spock' }
CHOICES_WORDS = CHOICES.values
PROGRAM_NAME = CHOICES_WORDS.map(&:capitalize).join(' ')

def prompt(msg)
  puts "=> #{msg}"
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

# Is there any way to shorten this method, or to split it up into multiple
# methods efficiently? I couldn't figure out a good way to do it that would
# make sense. Or is it okay in this situation?
def win?(comp_choice, user_choice)
  (user_choice == 'rock' && (comp_choice == 'scissors' || comp_choice ==
   'lizard')) ||
    (user_choice == 'paper' && (comp_choice == 'rock' || comp_choice ==
     'Spock')) ||
    (user_choice == 'scissors' && (comp_choice == 'paper' || comp_choice ==
     'lizard')) ||
    (user_choice == 'lizard' && (comp_choice == 'paper' || comp_choice ==
     'Spock')) ||
    (user_choice == 'Spock' && (comp_choice == 'rock' || comp_choice ==
     'scissors'))
end

def match_result(comp_choice, user_choice)
  if comp_choice == user_choice then 'tie'
  elsif win?(comp_choice, user_choice) then 'win'
  else 'lose'
  end
end

# Is there any way to shorten this method, or to split it up into multiple
# methods efficiently? I couldn't figure out a good way to do it that would
# make sense. Or is it okay in this situation?
def outcome_msg(comp_choice, user_choice)
  choices = comp_choice, user_choice

  if choices.include?('rock') && choices.include?('scissors')
    'Rock smashes scissors'
  elsif choices.include?('rock') && choices.include?('lizard')
    'Rock smashes lizard'
  elsif choices.include?('rock') && choices.include?('paper')
    'Paper covers rock'
  elsif choices.include?('rock') && choices.include?('Spock')
    'Spock vaporizes rock'
  elsif choices.include?('paper') && choices.include?('Spock')
    'Paper disproves Spock'
  elsif choices.include?('paper') && choices.include?('scissors')
    'Scissors cuts paper'
  elsif choices.include?('paper') && choices.include?('lizard')
    'Lizard eats paper'
  elsif choices.include?('scissors') && choices.include?('lizard')
    'Scissors decapitates lizard'
  elsif choices.include?('scissors') && choices.include?('Spock')
    'Spock smashes scissors'
  elsif choices.include?('lizard') && choices.include?('Spock')
    'Lizard poisons Spock'
  else
    "You both picked #{comp_choice}"
  end
end

def count_points(points, result)
  if result == 'win' then points[:user] += 1
  elsif result == 'lose' then points[:comp] += 1
  end
end

prompt "Welcome to #{PROGRAM_NAME}!"
prompt '--------------------------------------------'
puts

loop do
  points = { comp: 0, user: 0 }

  prompt 'The first one to reach 5 points wins!'
  loop do
    user_choice = gets_user_choice
    comp_choice = CHOICES_WORDS.sample
    result = match_result(comp_choice, user_choice)

    count_points(points, result)

    prompt 'Your choice:'.ljust(20) + user_choice
    prompt "Computer's choice:  #{comp_choice}"
    prompt "#{outcome_msg(comp_choice, user_choice)}, so you #{result} this" \
           " round#{result == 'win' ? '!' : '.'}"
    prompt "Your total points:       #{points[:user]}"
    prompt "Computer's total points: #{points[:comp]}"
    puts

    if points[:user] == 5
      prompt 'You have won the match!'
      break
    elsif points[:comp] == 5
      prompt 'The computer has won the match.'
      break
    end

    prompt 'Next round!'
  end

  puts
  prompt 'Would you like to play again? (y/n)'
  again = gets.chomp.downcase
  puts
  break unless again.start_with?('y')
end

prompt "Thank you for playing #{PROGRAM_NAME}. Goodbye!"
