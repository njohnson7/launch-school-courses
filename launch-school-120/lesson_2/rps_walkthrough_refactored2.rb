# rps_walkthrough_refactored2.rb

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end

end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, or scissors'
      choice = gets.chomp
      break if %w[rock paper scissors].include?(choice.downcase)
      puts 'Sorry, invalid choice.'
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w[R2D2 Hal Chappie Sonny Number5].sample
  end

  def choose
    self.move = Move.new(%w[rock paper scissors].sample)
  end
end

# practice:
class Move
  attr_accessor :move

  def initialize(m)
    @move = m
  end

  def >(other)
    (move == 'rock' && other.move == 'scissors') ||
      (move == 'paper' && other.move == 'rock') ||
      (move == 'scissors' && other.move == 'paper')
  end

  def <(other)
    (move == 'scissors' && other.move == 'rock') ||
      (move == 'rock' && other.move == 'paper') ||
      (move == 'paper' && other.move == 'scissors')
  end

  def ==(other)
    move == other.move
  end

  def to_s
    move
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors. Goodbye!'
  end

  def display_winner
    puts "\n\n#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    if human.move > computer.move
      puts "#{human.name} wins!"
    elsif human.move < computer.move
      puts "#{human.name} loses!"
    elsif human.move == computer.move
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "\nWould you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w[y n].include?(answer)
      puts "Sorry, must be 'y' or 'n'"
    end
    answer == 'y'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
