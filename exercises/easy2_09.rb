# easy2_09.rb

# Moving

# You have the following classes.

module Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable

  private

  def gait
    "runs"
  end
end

# You need to modify the code so that this works:

mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"

# You are only allowed to write one new method to do this
