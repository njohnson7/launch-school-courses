# basics_classes_objects_06.rb


# Hello, Sophie! (Part 2)

# Using the code from the previous exercise, move the greeting from the
# #initialize method to an instance method named #greet that prints a greeting
# when invoked.

class Cat
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

# Expected output:

# Hello! My name is Sophie!
