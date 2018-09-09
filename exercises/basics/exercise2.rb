# Exercise 2


# Solution 1

# Declare variables
n = 2784  # Enter any four digit number here
thousands = n / 1000  # Calculates thousands number of n using division operator
hundreds = n % 1000 / 100  # Calculates hundreds number of n using modulo and division operators
tens = n % 100 / 10  # Calculates tens number of n using modulo and division operators
ones = n % 10  # Calculates ones number of n using modulo operator

# Outputs number and results of calculations using string interpolation
puts "number: #{n}"
puts "thousands: #{thousands}"
puts "hundreds: #{hundreds}"
puts "tens: #{tens}"
puts "ones: #{ones}\n\n"  # Adds line break


# Solution 2 - same as above except uses extra module operators for tens and ones calculations

# Declare variables
n2 = 3962  # Enter any four digit number here
thousands2 = n2 / 1000  # Calculates thousands number of n using division operator
hundreds2 = n2 % 1000 / 100 # Calculates hundreds number of n using modulo and division operators
tens2 = n2 % 1000 % 100 / 10  # Calculates tens number of n using modulo and division operators
ones2 = n2 % 1000 % 100 % 10  # Calculates ones number of n using modulo operator

# Outputs number and results of calculations using string interpolation
puts "2nd number: #{n2}"
puts "thousands: #{thousands2}"
puts "hundreds: #{hundreds2}"
puts "tens: #{tens2}"
puts "ones: #{ones2}\n\n"


# Solution 3 - same as above without using variables

puts "3rd number: 8359"
puts "thousands: #{8359 / 1000}"
puts "hundreds: #{8359 % 1000 / 100}"
puts "tens: #{8359 % 1000 % 100 / 10}"
puts "ones: #{8359 % 10}"