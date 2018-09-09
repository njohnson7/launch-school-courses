# basics_inheritance_05.rb


# Towable (Part 1)

# Using the following code, create a module named Towable that contains a method
# named tow. The module should be included in Truck and tow should print I can
# tow a trailer! when invoked.

# class Truck
# end

# class Car
# end

# truck1 = Truck.new
# puts truck1.tow

# Expected output:

# I can tow a trailer!


Towable = Module.new { define_method(:tow) { puts 'I can tow a trailer!' } }

Truck = Class.new { include Towable }
Car = Class.new

truck1 = Truck.new
truck1.tow
