# rps_walkthrough.rb

# LS answer:

# 1) textual description of problem:
  # RPS is a 2 player game
    # each player chooses 1 of 3 possible moves: rock/paper/scissors
    # chosen moves are then compared to see who wins
      # rules:
        # rock > scissors
        # paper > rock
        # scissors > paper
      # if same move => tie

# 2) extract major nouns and verbs from description:
  # nouns: player, move, rule
  # verbs: choose, compare

# 3) organzing the verbs w/ the nouns:
  # Player
    # - choose
  # Move
  # Rule

  # - compare

# 4) outline of classes and methods:
class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?
      n = ''
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, must enter a value."
      end
      self.name = n
    else
      self.name = %w[R2D2 Hal Chappie Sonny Number5].sample
    end
  end

  def choose
    if human?
      choice = nil
      loop do
        puts 'Please choose rock, paper, or scissors'
        choice = gets.chomp
        break if %w[rock paper scissors].include?(choice.downcase)
        puts 'Sorry, invalid choice.'
      end
      self.move = choice
    else
      self.move = %w[rock paper scissors].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class Move
  def initialize
    # s/t to keep track of choice
    # move obj can be rock/paper/scissiors
  end
end

class Rule
  def initialize

  end
end

# not sure where 'compare' goes yet
def compare(move1, move2)

end

# Orchestration Engine:
  # now we need an 'engine' to orchestrate the objs
  # this is where the procedural program flow should be

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
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

RPSGame.new.play # easy interface to start things up
