# basics_inheritance_10.rb

# Transportation

# Create a module named Transportation that contains three classes: Vehicle,
# Truck, and Car. Truck and Car should both inherit from Vehicle.

module Transportation
  Vehicle = Class.new
  %w[Truck Car].each { |vehicle| eval("#{vehicle} = Class.new(Vehicle)") }
end

p v = Transportation::Vehicle.new
p t = Transportation::Truck.new
p c = Transportation::Car.new

p Transportation::Vehicle.ancestors
p Transportation::Car.ancestors
p Transportation::Truck.ancestors
