# rps_bonus2.rb
# frozen_string_literal: true

module Interface
  def prompt(msg)
    puts ">> #{msg}"
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_underscore_line
    puts ''.center(80, '_')
  end

  def display_empty_line(num = 1)
    num.times { puts }
  end
end

class Move
  VALUES = %w[rock paper scissors].freeze

  attr_reader :value

  def initialize(v)
    @value = v
  end

  def rock?
    value == 'rock'
  end

  def paper?
    value == 'paper'
  end

  def scissors?
    value == 'scissors'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def to_s
    value
  end
end

class Player
  include Interface

  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def reset_score
    self.score = 0
  end
end

class Human < Player
  CHOICES = Move::VALUES.map { |value| [value[0], value] }.to_h

  def set_name
    loop do
      prompt "Please enter your name:"
      n = gets.chomp
      break self.name = n unless n.empty?
      prompt "Name cannot be empty."
    end
  end

  def name
    "#{@name[0].upcase}#{@name[1..-1]}"
  end

  def choose
    loop do
      prompt 'Please choose (r)ock, (p)aper, or (s)cissors:'
      choice = gets.chomp.downcase
      if CHOICES.to_a.flatten.include?(choice)
        self.move = Move.new(CHOICES[choice[0]])
        break
      end
      prompt 'Invalid choice.'
    end
  end
end

class Computer < Player
  def set_name
    self.name = %w[R2D2 Hal Chappie Sonny Number5].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  include Interface

  POINTS_TO_WIN = 2

  attr_reader :human, :computer

  def initialize
    clear_screen
    display_welcome_msg
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_msg
    display_underscore_line
    puts "Welcome to Rock-Paper-Scissors!".center(80)
    display_underscore_line
    display_empty_line(3)
  end

  def display_goodbye_msg
    clear_screen
    display_underscore_line
    puts 'Thank you for playing Rock-Paper-Scissors! Goodbye!'.center(80)
    display_underscore_line
  end

  def play_again?
    msg = ">> Enter any key to play again or 'q' to quit: "
    display_empty_line(2)
    puts '-' * (msg.size - 1)
    print msg
    choice = gets.chomp.downcase
    choice != 'q'
  end

  def match_over?
    [human.score, computer.score].any? { |score| score == POINTS_TO_WIN }
  end

  def display_winner
    if human.score > computer.score
      "#{human.name} won the match!"
    else
      "#{computer.name} won the match!"
    end
  end

  def play
    loop do
      round_num = 1
      loop do
        Round.new(human, computer, round_num).play
        break if match_over?
        Round.next
        round_num += 1
      end
      display_winner
      break unless play_again?
      [human, computer].each { |player| player.reset_score }
    end
    display_goodbye_msg
  end
end

class Round
  include Interface

  attr_accessor :winner
  attr_reader :human, :computer, :round_num, :ljust_amount

  def self.next
    print ">> Press enter to begin next round..."
    gets
  end

  def initialize(human, computer, round_num)
    @human = human
    @computer = computer
    @round_num = round_num
    @ljust_amount = [human.name.size, computer.name.size].max + 12
  end

  def human_won?
    winner == human
  end

  def computer_won?
    winner == computer
  end

  def display_start
    msg = "ROUND #{round_num}!"
    clear_screen
    prompt msg
    puts "=" * (msg.size + 3)
    display_empty_line(2)
  end

  def display_moves
    [human, computer].each do |player|
      puts " - #{player.name} chose:".ljust(ljust_amount) + player.move.to_s
    end
    display_empty_line
  end

  def display_winner
    # prompt case winner
    #        when :human    then "#{human.name} won the round!"
    #        when :computer then "#{computer.name} won the round!"
    #        else                "This round is a tie!"
    #        end
    prompt(winner == :tie ? "It's a tie!" : "#{winner.name} has won the round!")
    # display_empty_line
  end

  def display_score
    [human, computer].each do |player|
      puts " - #{player.name} score:".ljust(ljust_amount) + player.score.to_s
    end
    display_empty_line
  end

  def set_winner
    self.winner = if    human.move > computer.move then human
                  elsif computer.move > human.move then computer
                  else                                  :tie
                  end
  end

  def increment_points
    human.score    += 1 if human_won?
    computer.score += 1 if computer_won?
  end

  def play
    display_start
    [human, computer].each { |player| player.choose }
    set_winner
    increment_points
    display_moves
    display_winner
    display_score
  end

end

RPSGame.new.play
