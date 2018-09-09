# basics_classes_objects2_01.rb


# Generic Greeting (Part 1)

# Modify the following code so that Hello! I'm a cat! is printed when
# Cat.generic_greeting is invoked.

# class Cat
# end

# Cat.generic_greeting

# Expected output:

# Hello! I'm a cat!


class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting


# Further Exploration

kitty = Cat.new
kitty.class.generic_greeting

# What happens if you run kitty.class.generic_greeting? Can you explain this
# result?

# kitty.class would return the class of the instance kitty, which is Cat, so
#  this would invoke the Cat::generic_greeting method the same as writing
#  Cat.generic_greeting.
