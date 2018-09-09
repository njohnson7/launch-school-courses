# easy2_02.rb
# How big is the room?

# Build a program that asks a user for the length and width of a room in meters
# and then displays the area the of the room in both square meters and square
# feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

SQMETERS_TO_SQFEET = 10.7639

puts '=> Please enter room length in meters:'
length = gets.to_f

puts '=> Please enter room width in meters:'
width = gets.to_f

area_meters = (length * width).round(2)
area_feet = (area_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{area_meters} square meters (#{area_feet}" \
     ' square feet).'
puts


# Modify this program to ask for the input measurements in feet, and display
# the results in square feet, square inches, and square centimeters.

SQFEET_TO_SQINCHES = 144
SQINCHES_TO_SQCENTIMETERS = 6.4516

puts '=> Please enter room length in feet:'
length = gets.to_f

puts '=> Please enter room width in feet:'
width = gets.to_f

area_feet = (length * width).round(2)
area_inches = (area_feet * SQFEET_TO_SQINCHES).round(2)
area_centimeters = (area_inches * SQINCHES_TO_SQCENTIMETERS).round(2)

puts "The area of the room is #{area_feet} square feet (#{area_inches}" \
     " square inches) (#{area_centimeters} square centimeters)."
