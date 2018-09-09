# easy7_07.rb
# Multiplicative Average

# Write a method that takes an Array of integers as input, multiplies all of the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places.

def show_multiplicative_average(numbers)
  result = (numbers.reduce(:*) / numbers.size.to_f)
  puts "The result is #{format('%.3f', result)}"
end

show_multiplicative_average([3, 5]) # The result is 7.500
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # The result is 28361.667
show_multiplicative_average([1, 2, 3, 4])
show_multiplicative_average([2, 3, 4])
show_multiplicative_average([2, 3, 4, 5])
show_multiplicative_average([4, 9, 2, 13, 17])


# What happens if you omit the call to #to_f on the first line of our method?

# It will cut off all the digits after the decimal, so the results will all end
#  with '.000'. (ie, the remainder will not be included in the result.)
