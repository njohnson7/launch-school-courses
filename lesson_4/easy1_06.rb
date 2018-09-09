# easy1_06.rb

# What could we add to the class below to access the instance variable @volume?

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end

  def volume
    @volume
  end
end

cube = Cube.new(100)
p cube.volume

# We need to add a getter method, a method that will return the value of
#  @volume when we call it on a Cube object. We can either do this by manually
#  creating a method that returns @volume, or using the keyword attr_reader
#  followed by :volume, which is a shortcut that makes Ruby automatically
#  create a getter method for us. We could also use attr_accessor, which would
#  create both a getter and a setter method, so that way we could call
#  #volume= on the Cube object to assign its @volume to whatever we wanted.
# We could also call Object#instance_variable_get on an instance of cube,
#  passing in :@volume as an argument, and it would return the value of @volume.
