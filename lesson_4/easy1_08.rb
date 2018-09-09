# easy1_08.rb

# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. What does
# self refer to here?

# self here refers to the object that the make_one_year_older method is called
#  on, which would be an instance of the Cat class, since this method is an
#  instance method. So self.age would be the same as appending .age to the name
#  of the variable that points to the Cat object, or the same as
#  Cat.new.make_one_year_older, since Cat.new is an instance of Cat. This would
#  increment the @age variable by one, using the setter_method created
#  automatically by the attr_accessor :age line at the top of the class
#  definition. self references the calling object.
