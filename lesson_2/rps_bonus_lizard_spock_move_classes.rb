# rps_bonus_lizard_spock_move_classes.rb
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
  VALUES = %w[rock paper scissors lizard zpock].freeze

  attr_reader :value

  def initialize
    @value = self.class.name.downcase
  end

  def ==(other_move)
    value == other_move.value
  end

  def battle_msg(other_move)
    if self == other_move
      "#{self} has no effect on #{self}".gsub(/\A\w/, &:upcase)
    end
  end

  def to_s
    value
  end

  def rock?
    false
  end

  def paper?
    false
  end

  def scissors?
    false
  end

  def lizard?
    false
  end

  def zpock?
    false
  end
end

class Rock < Move
  def rock?
    true
  end

  def >(other_move)
    other_move.scissors? || other_move.lizard?
  end

  def battle_msg(other_move)
    super ? super : "#{self} crushes #{other_move}".capitalize
  end
end

class Paper < Move
  def paper?
    true
  end

  def >(other_move)
    other_move.rock? || other_move.zpock?
  end

  def battle_msg(other_move)
    verb = other_move.rock? ? 'covers' : 'disproves'
    super ? super : "#{self} #{verb} #{other_move}".gsub(/\A\w/, &:upcase)
  end
end

class Scissors < Move
  def scissors?
    true
  end

  def >(other_move)
    other_move.paper? || other_move.lizard?
  end

  def battle_msg(other_move)
    verb = other_move.paper? ? 'cuts' : 'decapitates'
    super ? super : "#{self} #{verb} #{other_move}".capitalize
  end
end

class Lizard < Move
  def lizard?
    true
  end

  def >(other_move)
    other_move.paper? || other_move.zpock?
  end

  def battle_msg(other_move)
    verb = other_move.paper? ? 'eats' : 'poisons'
    super ? super : "#{self} #{verb} #{other_move}".gsub(/\A\w/, &:upcase)
  end
end

class Zpock < Move
  def zpock?
    true
  end

  def >(other_move)
    other_move.rock? || other_move.scissors?
  end

  def to_s
    value.capitalize
  end

  def battle_msg(other_move)
    verb = other_move.rock? ? 'vaporizes' : 'smashes'
    super ? super : "#{self} #{verb} #{other_move}".capitalize
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
      prompt 'Please choose (r)ock, (p)aper, (s)cissors, (l)izard, or (Z)pock:'
      choice = gets.chomp.downcase
      if CHOICES.to_a.flatten.include?(choice)
        move_class = eval(CHOICES[choice[0]].capitalize)
        self.move = move_class.new
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
    self.move = eval(Move::VALUES.sample.capitalize).new
  end
end

class Round
  include Interface

  attr_accessor :winner
  attr_reader :human, :computer, :round_num, :ljust_amount

  def self.next
    print "\n>> Press enter to begin next round..."
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
    winning_move, losing_move = sort_moves_by_winner
    w_msg = winner == :tie ? "it's a tie!" : "#{winner.name} has won the round!"
    prompt "#{winning_move.battle_msg(losing_move)} so #{w_msg}"
  end

  def display_score
    [human, computer].each do |player|
      score_str = "#{player.score} of #{RPSGame::POINTS_TO_WIN}"
      puts " - #{player.name} score:".ljust(ljust_amount) + score_str
    end
    display_empty_line
  end

  def sort_moves_by_winner
    moves = [human.move, computer.move]
    winner == computer ? moves.reverse : moves
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

class RPSGame
  include Interface

  PROGRAM_NAME = Move::VALUES.map(&:capitalize).join('-').freeze
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
    puts "Welcome to #{PROGRAM_NAME}!".center(80)
    display_underscore_line
    display_empty_line(3)
  end

  def display_goodbye_msg
    clear_screen
    display_underscore_line
    puts "Thank you for playing #{PROGRAM_NAME}! Goodbye!".center(80)
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
    winner = human.score > computer.score ? human : computer
    prompt "#{winner.name} has won the match with #{POINTS_TO_WIN} points!"
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

RPSGame.new.play
