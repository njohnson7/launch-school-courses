# basics_inheritance_02.rb


# Start the Engine (Part 1)

# Modify the following code so that #start_engine is invoked upon initialization
# of truck1.

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   def start_engine
#     puts 'Ready to go!'
#   end
# end

# truck1 = Truck.new(1994)
# puts truck1.year

# Expected output:

# Ready to go!
# 1994



# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   def initialize(year)
#     super
#     start_engine
#   end

#   def start_engine
#     puts 'Ready to go!'
#   end
# end

# truck1 = Truck.new(1994)
# puts truck1.year



# Alternate solution:

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#     start_engine
#   end
# end

# class Truck < Vehicle
#   def start_engine
#     puts 'Ready to go!'
#   end
# end

# truck1 = Truck.new(1994)
# puts truck1.year



# Alternate solution 2:

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
    start_engine
  end

  private

  def start_engine
    puts 'Ready to go!'
  end
end

Truck = Class.new(Vehicle)

truck1 = Truck.new(1994)
puts truck1.year
