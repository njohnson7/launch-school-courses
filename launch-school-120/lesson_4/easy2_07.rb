# easy2_07.rb

# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would
# you need to write to test your theory?

# The @@cats_count variable is a class variable that keeps track of the number
#  of Cat objects that have been instantialized in the program. At the beginning
#  of the Cat class definition, it is initialized to 0, because when the Cat
#  class definition is first executed by Ruby, we know that there can currently
#  be no existing instances of Cat, since the Cat class has to be defined before
#  an instance of it can be insantialized.
# Then in the constructor method, initialize, the last line increments
#  @@cats_count by 1 every time the initialize method is executed. The
#  constructor method will be executed every time a new Cat object is
#  instantialized, by calling Cat.new, so for every instance of Cat that is
#  created, @@cats_count will be incremented by 1, which allows us to keep
#  track of the total number of Cat objects that have been created in the
#  program.
# We can see the current value of @@cats_count by using the Cat class getter
#  method, self.cats_count, which will return the value referenced by
#  @@cats_count.
# To test this theory we could write the following code:

p Cat.cats_count # => 0
Cat.new('blue')
p Cat.cats_count # => 1
Cat.new('blue')
Cat.new('blue')
p Cat.cats_count # => 3
# (allocate instantiates an object without calling the constructor method)...
Cat.allocate
p Cat.cats_count # => 3 # ...so @@cats_count is not incremented
Cat.new('blue')
p Cat.cats_count # => 4
