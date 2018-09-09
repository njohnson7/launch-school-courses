# easy1_10.rb


# If we have the class below, what would you need to call to create a new
# instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end


# You can call Bag.new, passing in 2 arguments, one for the color and one for
#  the material, to instantiate an object of the Bag class, creating a new
#  instance of Bag. You could also call Bag.allocate, which would create a new
#  instance of Bag without executing the constructor method, so you wouldn't
#  need to pass in any arguments in this case.
