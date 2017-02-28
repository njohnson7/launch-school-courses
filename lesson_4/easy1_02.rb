# easy1_02.rb

# If we have a Car class and a Truck class and we want to be able to go_fast,
# how can we add the ability for them to go_fast using the module Speed? How can
# you check if your Car or Truck can now go fast?

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

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

car = Car.new
car.go_slow
car.go_fast

truck = Truck.new
truck.go_very_slow
truck.go_fast

p car.respond_to?(:go_fast)
p truck.respond_to?(:go_fast)

# We can add the include keyword followed by the name of the module we want to
#  include (Speed) at the top of the Car and Truck class definitions, to allow
#  them to use any methods in the Speed module, such as the go_fast instance
#  method.
# We can check if they can now go fast either by calling Speed#go_fast on an
#  instance of Car or Truck, and seeing if an error is raised, or by calling the
#  Object#respond_to? method on an instance of Car or Truck, passing in the name
#  of the go_fast method as a symbol or a string, which will either return true
#  or false, depending on whether that method can be called on that instance.
