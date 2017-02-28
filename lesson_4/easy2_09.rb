# easy2_09.rb

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    "Bingo: " + super
  end
end

p Bingo.new.play

# What would happen if we added a play method to the Bingo class, keeping in
# mind that there is already a method of this name in the Game class that the
# Bingo class inherits from.


# Adding a play method to the bingo class would override the play method in the
#  Game class, so Ruby would only execute the code in the Bingo#play method,
#  and ignore the code in the Game#play method, unless we put the super keyword
#  somewhere in the Bingo#play method, which would call the Game#play method,
#  since it is the method with the same name in Bingo's superclass. We can call
#  the Game#play method as many times as we would like by putting in the super
#  keyword that amount of times. super with one or more arguments will pass
#  those arguments to the method with the same name in the superclass, or without
#  any arguments, it will pass whatever arguments were passed in to the method
#  it was called from to the superclass's method, or with empty ()s it will
#  call the superclass's method without passing in any arguments.

# Ruby will call the first method that is found with a matching name in the
#  method lookup chain when a method is called.

module Fringo
  def play
    'FRINGO IS CRAZY!'
  end
end

class Bingo
  include Fringo
end

p Bingo.new.play

# So if we include the Fringo module, the super keyword in play will now
#  reference the Fringo#play method because Fringo is the next ancestor of
#  Bingo in the method lookup hierarchy.
