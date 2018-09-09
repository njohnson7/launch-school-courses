# basics_inheritance_01.rb


# Inherited Year

# Using the following code, create two classes - Truck and Car - that both
# inherit from Vehicle.

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# truck1 = Truck.new(1994)
# puts truck1.year

# car1 = Car.new(2006)
# puts car1.year

# Expected output:

# 1994
# 2006


class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

Truck = Class.new(Vehicle)
Car = Class.new(Vehicle)

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year
