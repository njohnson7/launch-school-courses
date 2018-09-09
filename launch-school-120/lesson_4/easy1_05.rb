# easy1_05.rb

# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  attr_reader :r
  attr_writer :w
  attr_accessor :a

  def initialize(name)
    @name = name
  end

  def xx
    @x = 'x'
  end
end

pizza = Pizza.new('cheese')
fruit = Fruit.new('pineapple')
# p fruit.name
p pizza.r
# p pizza.w
p pizza.a
# p pizza.x
# p pizza.name
puts
p pizza.instance_variable_defined?(:@r)
p pizza.instance_variable_defined?(:@w)
p pizza.instance_variable_defined?(:@a)
p pizza.instance_variable_defined?(:@x)
p pizza.instance_variable_defined?(:@qqqq)
p pizza.instance_variable_defined?(:@name)
puts
p pizza.instance_variable_get(:@r)
p pizza.instance_variable_get(:@w)
p pizza.instance_variable_get(:@a)
p pizza.instance_variable_get(:@x)
p pizza.instance_variable_get(:@qqqq)
p pizza.instance_variable_get(:@name)
puts
p pizza.instance_variables


# The Pizza class has an instance variable, @name, whereas the Fruit class does
#  not have any instance variables. The initialize method of the Fruit class
#  only contains a line of code that creates a new local variable called name
#  and assigns it to the object referenced by the name parameter. We can tell
#  that name is a local variable because it is all lowercase, and does not have
#  an @ as the first character.

# We can tell that the Pizza class has an instance variable, @name, because a
#  single @ character is prepended to the name, and the name is all lowercase.
#  When we create a new Pizza instance, we will pass in an argument which gets
#  bound to the name parameter, and then we assign @name to the object that
#  is referenced by name, initializing the @name instance variable.

# If we were unable to see the code making up the two above classes, we could
#  also find out if the classes have an instance variable by insantiating a new
#  instance of the class, and then calling Object#instance_variable_defined on
#  the instance, passing in the name of the instance varaible we are trying to
#  find as an argument in the form of a Symbol or String, which will return
#  a boolean that will inform us if that instance variable has been initialized
#  for that instance of the class. However, this won't let us know if there
#  is an uninitialized variable with that name.

# We can also call Object#instance_variable_get on an instance of Pizza, which
#  works in a similar fashion, except that instead of returning a boolean, it
#  returns the value of the instance variable, or nil if that variable does not
#  exist or is not initialized.

# We can also call Object#instance_variables on an instance of Pizza, which will
#  return an array containing the names of all the instance variables that have
#  been initialized in that instance of Pizza in symbol format.



# How to find out if there are any undefined instance variables?
