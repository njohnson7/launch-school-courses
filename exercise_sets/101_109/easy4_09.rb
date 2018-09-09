# easy4_09.rb
# Convert a Number to a String!

# In the previous two exercises, you developed methods that convert simple
#  numeric strings to signed Integers. In this exercise and the next, you're
#  going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a
# string representation.

# You may not use any of the standard conversion methods available in Ruby, such
#  as Integer#to_s, String(), Kernel#format, etc. Your method should do this the
#  old-fashioned way and construct the string by analyzing and manipulating the
#  number.

# Examples:

# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(num)
  return '0' if num == 0
  digits_ary = []

  while num > 0
    num /= 10.0
    digits_ary.unshift((num % 1).round(1))
    num -= digits_ary.first
  end

  digits_ary.map { |digit| DIGITS[(digit * 10).round(0)] }.join
end

p integer_to_string(4321) #=> '4321'
p integer_to_string(0) #=> '0'
p integer_to_string(5000) #=> '5000'
p integer_to_string(10528020)
p integer_to_string(5)
p integer_to_string(23)
p integer_to_string(403)
p integer_to_string(4000)
p integer_to_string(93918)
p integer_to_string(248002)
p integer_to_string(2480002)
p integer_to_string(24800005)
p integer_to_string(200480005)
p integer_to_string(2004800050)
puts


# Book solution:
def integer_to_string(num)
  result = ''
  loop do
    num, remainder = num.divmod(10)
    result.prepend(DIGITS[remainder])
    break if num == 0
  end

  result
end

p integer_to_string(4321) #=> '4321'
p integer_to_string(0) #=> '0'
p integer_to_string(5000) #=> '5000'
p integer_to_string(10528020)
p integer_to_string(5)
p integer_to_string(23)
p integer_to_string(403)
p integer_to_string(4000)
p integer_to_string(93918)
p integer_to_string(248002)
p integer_to_string(2480002)
p integer_to_string(24800005)
p integer_to_string(200480005)
p integer_to_string(2004800050)
puts
