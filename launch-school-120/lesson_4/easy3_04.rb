# easy3_04.rb

# Given the class below, if we created a new instance of the class and then
# called to_s on that instance we would get something like
# "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end
end

# How could we go about changing the to_s output on this method to look like
# this: I am a tabby cat? (this is assuming that "tabby" is the type we passed
# in during initialization).

# The string above is the returned value of calling Object#to_s on an instance
#  of Cat. Object#to_s will return a string containing the name of the class of
#  the object it was called on, followed by an encoding of the object id.
# All objects inherit Object#to_s, but we can override that to provide
#  custom functionality by defining a to_s instance method in the Cat class
#  definition. For example:

class Cat
  def to_s
    "I am a #{@type} cat"
  end
end

tabby = Cat.new('tabby')
puts tabby
p tabby.to_s

class Cat
  attr_reader :type
end

p tabby.type
