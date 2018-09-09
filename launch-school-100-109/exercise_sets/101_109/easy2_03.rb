# easy2_03.rb
# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the
# tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.
0
NUM_TO_PERCENTAGE = 0.01

puts '=> Please enter bill amount:'
bill_amount = gets.to_f
puts '=> Please enter tip percentage:'
tip_rate = gets.to_f * NUM_TO_PERCENTAGE

tip = bill_amount * tip_rate
total = bill_amount + tip

puts "The tip is:   $#{format('%02.2f', tip)}"
puts "The total is: $#{format('%02.2f', total)}"
