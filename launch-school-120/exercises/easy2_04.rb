# easy2_04.rb

# Reverse Engineering

# Write a class that will display:

# ABC
# xyz

# when the following code is run:

class Transform
  def self.lowercase(str)
    str.downcase
  end

  def initialize(data)
    @data = data
  end

  def uppercase
    @data.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
