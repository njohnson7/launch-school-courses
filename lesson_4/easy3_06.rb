# easy3_06.rb

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

# In the make_one_year_older method we have used self. What is another way we
# could write this method so we don't have to use the self prefix?


# We can write it like: @age += 1
# Currently we are using the setter method created by the attr_accessor method
#  to increment the @age instance variable by 1, which is why we have to prepend
#  self. to age. age= is the name of the setter method, so self.age += 1 could
#  be rewritten as self.age=(self.age + 1). self.age in the ()s would be a call
#  to the getter method, age, in this case, which was also created by the
#  attr_accessor method at the top of the Cat class definition. If we were to
#  leave out the self at and just do, age += 1, Ruby would interpret age as
#  a local variable, and @age would not be modified. Therefore we have to
#  prepend the @ symbol to age to let Ruby know that we want to reference the
#  instance variable @age. Now we would be incrementing @age directly, without
#  using the setter method at all.
