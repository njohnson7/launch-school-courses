# easy2_08.rb

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And another class:

class Bingo < Game
  def rules_of_play
    'rules'
  end
end

bingo = Bingo.new
p bingo.rules_of_play
p bingo.play

# What can we add to the Bingo class to allow it to inherit the play method from
# the Game class?


# We could append < Game to the class definition line of Bingo, to make it
#  a child of the Game class, which would allow it to inhereit all the methods
#  defined in the Game class definition. Bingo would be a subclass or derived
#  class of Game, and Game would be the parent class, superclass, base class, and
#  an ancestor of Bingo.
