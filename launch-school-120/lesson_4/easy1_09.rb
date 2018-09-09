# easy1_09.rb

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

# In the name of the cats_count method we have used self. What does self refer
# to in this context?

# Here self still refers to the object that the cats_count method is called on,
#  but in this case, the object will be the Cat class itself, instead of an
#  instance of Cat. This is because the self is placed in the method definition
#  line, so the context is the body of the class definition. Prepending self
#  to the name of a method defined in a class, makes it a class method. Now
#  we can call Cat.cats_count to return the class variable, @@cats_count, which
#  would be an Integer equal to the number of times a Cat instance has been
#  instantiated in the program, as @@cats_count is initialized to 0 at the
#  beginning of the Cat class definition, and it gets incremented by 1 every
#  time the instance constructer method, initialize, is called to create a
#  new Cat object.
