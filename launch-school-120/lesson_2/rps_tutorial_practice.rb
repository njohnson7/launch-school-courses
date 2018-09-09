# rps_tutorial_practice.rb

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
  def initialize
    # @name?
    # @move?
  end

  def choose

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
    # what should @state of rule obj be?
  end
end

# not sure where 'compare' goes yet
def compare(move1, move2)

end

# Orchestration Engine:
  # now we need an 'engine' to orchestrate the objs
  # this is where the procedural program flow should be

# outline:
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new
  end

  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play # easy interface to start things up






# practice...:
class Player
  def initialize(name, move)
    @name = name
    @move = choose
  end

  def choose
    # if @name == :computer then MOVES.sample
    # else get_user_input
    # end
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
    # what should @state of rule obj be?
  end
end

# not sure where 'compare' goes yet
def compare(move1, move2)

end