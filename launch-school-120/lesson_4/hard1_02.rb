# hard1_02.rb

# Ben and Alyssa are working on a vehicle management system. So far, they have
# created classes called Auto and Motorcycle to represent automobiles and
# motorcycles. After having noticed common information and calculations they
# were performing for each type of vehicle, they decided to break out the
# commonality into a separate class called WheeledVehicle. This is what their
# code looks like so far:

module Transportable
  attr_accessor :speed, :heading

  def initialize(km_per_liter, liters)
    @fuel_efficiency = km_per_liter
    @fuel_capacity = liters
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Transportable

  def initialize(tire_array, km_per_liter, liters)
    @tires = tire_array
    super(km_per_liter, liters)
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

# Now Alan has asked them to incorporate a new type of vehicle into their system
# - a Catamaran defined as follows:

class Catamaran
  include Transportable

  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_per_liter, liters)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    super(km_per_liter, liters)
  end
end

# This new class does not fit well with the object hierarchy defined so far.
# Catamarans don't have tires. But we still want common code to track fuel
# efficiency and range. Modify the class definitions and move code into a
# Module, as necessary, to share code among the Catamaran and the wheeled
# vehicles.



p car = Auto.new
p moto = Motorcycle.new
p catamaran = Catamaran.new(2, 4, 200, 10.0)

p car.tire_pressure(1)
p car.inflate_tire(1, 40)
p car.tire_pressure(1)
p car.range
p moto.tire_pressure(1)
p moto.inflate_tire(1, 40)
p moto.tire_pressure(1)
p moto.range

p catamaran.range
p catamaran.propeller_count
p catamaran.hull_count
