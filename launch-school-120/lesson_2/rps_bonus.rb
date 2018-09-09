# rps_bonus.rb
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

  def display_empty_lines(num)
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
    display_empty_lines(3)
  end

  def display_goodbye_msg
    clear_screen
    display_underscore_line
    puts 'Thank you for playing Rock-Paper-Scissors! Goodbye!'.center(80)
    display_underscore_line
  end

  def display_round_start(round_num)
    msg = "ROUND #{round_num}!"
    clear_screen
    prompt msg
    puts "=" * (msg.size + 3)
    display_empty_lines(2)
  end

  def display_moves
    ljust_amt = [human.name.size, computer.name.size].max + 12
    puts " - #{human.name} chose:".ljust(ljust_amt) + human.move.to_s
    puts " - #{computer.name} chose:".ljust(ljust_amt) + computer.move.to_s
    puts
  end

  def display_winner
    prompt case determine_winner
           when :human    then "#{human.name} won!"
           when :computer then "#{computer.name} won!"
           else                "It's a tie!"
           end
  end

  def determine_winner
    if    human.move > computer.move then :human
    elsif computer.move > human.move then :computer
    else                                  :tie
    end
  end

  def increment_points

  end

  def play_round(round_num)
    display_round_start(round_num)
    human.choose
    computer.choose
    display_moves
    display_winner
  end

  def play_again?
    msg = ">> Enter any key to play again or 'q' to quit: "
    display_empty_lines(2)
    puts '-' * (msg.size - 1)
    print msg
    choice = gets.chomp.downcase
    choice != 'q'
  end

  def play
    round_num = 1
    loop do
      play_round(round_num)
      break unless play_again?
      round_num += 1
    end
    display_goodbye_msg
  end
end

RPSGame.new.play




# class Match
#   def initialize(human, computer)
#     @round_num = 1
#   end

#   def play
#     human.choose
#     computer.choose
#   end
# end

class Round
  attr_accessor :winner

  def initialize(human, computer)
    @human = human
    @computer = computer
  end

  def play

  end

end