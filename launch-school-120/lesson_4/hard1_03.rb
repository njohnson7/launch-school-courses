# hard1_03.rb

# Building on the prior vehicles question, we now must also track a basic
# motorboat. A motorboat has a single propeller and hull, but otherwise behaves
# similar to a catamaran. Therefore, creators of Motorboat instances don't need
# to specify number of hulls or propellers. How would you modify the vehicles
# code to incorporate a new Motorboat class?

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

class Boat
  include Transportable

  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_per_liter, liters)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    super(km_per_liter, liters)
  end
end

class Catamaran < Boat
end

class Motorboat < Boat
  def initialize(km_per_liter, liters)
    super(1, 1, km_per_liter, liters)
  end
end


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
puts


p motorboat = Motorboat.new(60, 5.0)
p motorboat.range
p motorboat.propeller_count
p motorboat.hull_count
