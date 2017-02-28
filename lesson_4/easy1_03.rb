# easy1_03.rb

# In the last question we had a module called Speed which contained a go_fast
# method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

# When we called the go_fast method from an instance of the Car class (as shown
# below) you might have noticed that the string printed when we go fast includes
# the name of the type of vehicle we are using. How is this done?

small_car = Car.new
small_car.go_fast # I am a Car and going super fast!

# The name of the type of vehicle we are driving is printed in the string upon
#  calling go_fast because in the Speed#go_fast method, we are calling puts on
#  a string containing an interpolation of the method Object#class being called
#  on self. self is a keyword which refers to the object that the current method
#  is attached to. In this case, that object is an instance of Car, since
#  we have included the Speed module in the Car class, and go_fast is an
#  instance method, so we call go_fast on the instance of Car referenced by
#  the small_car variable. small_car.self returns a Car object, and if we call
#  Object#class on that object, it returns the name of the class it belongs to
#  as a constant. When we interpolate it into a string using #{} syntax, Ruby
#  automatically calls Object#to_s on the Car constant, converting it into a
#  string, which gives us the class name of the small_car object as a String.
