# OBJECT ORIENTED DESIGN

=begin

- OOP DESIGN:
  - organizing and modularizing code into a cohesive structure of classes.
  - knowledge of OOP helps us to build better designed applications
  - there are wrong ways to approach OO design, but no official right way
    - only different tradeoffs
      - flexibility vs indirection:
        - the more flexible your code, the more indirection you'll introduce by way of more classes
        - the proper balance will change as your application matures

=end

# SPIKE:

# Description of problem:
# A coin is flipped. Each player chooses whether they want heads or tails. If the side that they chose faces up, then they win.

# Extract nouns and verbs from description:
# nouns: coin, side, player
# verbs: flip, win

# Organize into classes/methods
# Coin, Player
# flip, win

# make an outline of possible design choices:

class Coin
  def initialize
    @sides = [:heads, :tails]
  end

  def flip
    @sides.sample
  end
end

class Player
  def initialize(name)
    @name = name
  end

  def win
    "#{name} wins..."
  end
end

class Human < Player
  def choose_side
    # gets...
  end
end

class Computer < Player
  def choose_side
    # random...
  end
end

class FlipCoin
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    # display_welcome_msg
    # @human.choose_side
    # @computer.choose_side
    # determine_winner
    # display_goodbye_msg
  end
end