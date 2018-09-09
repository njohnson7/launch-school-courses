# rps_walkthrough_refactored.rb

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
    self.move = choice
  end
end

class Computer < Player
  def set_name
    self.name = %w[R2D2 Hal Chappie Sonny Number5].sample
  end

  def choose
    self.move = %w[rock paper scissors].sample
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
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    case human.move
    when computer.move
      puts "It's a tie!"
    when 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{human.name} lost!" if computer.move == 'paper'
    when 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{human.name} lost!" if computer.move == 'scissors'
    when 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{human.name} lost!" if computer.move == 'rock'
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
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