# easy3_03.rb

# When objects are created they are a separate realization of a particular
# class.

# Given the class below, how do we create two different instances of this class,
# both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

chester = AngryCat.new(5, 'Chester')
muffins = AngryCat.new(8, 'Muffins')
muffins.name
muffins.age
muffins.hiss
chester.name
chester.age


# We can call Class::new on the AngryCat class twice, passing in two arguments,
#  one for name and one for age. When Class::new is called, the arguments
#  passed in are assigned to the parameters in the object constructor method
#  of AngryCat, initialize, and then @age and @name are assigned to the object
#  referenced by these parameters. So the @name and @age attributes be
#  initialized the objects bound to the parameters. If we pass in different
#  values when instantiating each cat, then each cat will have a different
#  @name and @age member field. Then we can all the instance methods name and
#  age to print out the values contained in these instance variables as a string,
#  in order to confirm that each of these cats have 2 different sets of
#  attributes

# Ruby calls the initialize method by default on object creation
