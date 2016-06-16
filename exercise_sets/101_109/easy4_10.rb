# easy4_10.rb
# Convert a Signed Number to a String!

# In the previous exercise, you developed a method that converts non-negative
#  numbers to strings. In this exercise, you're going to extend that method by
#  adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string
#  representation.

# You may not use any of the standard conversion methods available in Ruby,
#  such as Integer#to_s, String(), Kernel#format, etc. You may, however,
#  use integer_to_string from the previous exercise.

# Examples:

# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'

DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(num)
  digits_ary = []

  while num > 0
    num /= 10.0
    digits_ary.unshift((num % 1).round(1))
    num -= digits_ary.first
  end

  digits_ary.map { |digit| DIGITS[(digit * 10).round(0)] }.join
end

def signed_integer_to_string(num)
  return '0' if num == 0

  if num < 0
    num = -num
    negative = true
  end
  num_str = integer_to_string(num)

  num_str.prepend(negative ? '-' : '+')
end

p signed_integer_to_string(4321) #=> '+4321'
p signed_integer_to_string(-123) #=> '-123'
p signed_integer_to_string(0) #=> '0'
p signed_integer_to_string(60024)
p signed_integer_to_string(-9273)
p signed_integer_to_string(-21572903)
p signed_integer_to_string(84723450)
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

def signed_integer_to_string(num)
  case num <=> 0
  when -1 then "-#{integer_to_string(-num)}"
  when +1 then "+#{integer_to_string(num)}"
  else         integer_to_string(num)
  end
end

p signed_integer_to_string(4321) #=> '+4321'
p signed_integer_to_string(-123) #=> '-123'
p signed_integer_to_string(0) #=> '0'
p signed_integer_to_string(60024)
p signed_integer_to_string(-9273)
p signed_integer_to_string(-21572903)
p signed_integer_to_string(84723450)
puts


# Refactor our solution to reduce the 3 integer_to_string calls to just one.

def signed_integer_to_string(num)
  sign = case num <=> 0
         when -1
           num = -num
           '-'
         when +1
           '+'
         else
           ''
         end

  sign + integer_to_string(num)
end

p signed_integer_to_string(4321) #=> '+4321'
p signed_integer_to_string(-123) #=> '-123'
p signed_integer_to_string(0) #=> '0'
p signed_integer_to_string(60024)
p signed_integer_to_string(-9273)
p signed_integer_to_string(-21572903)
p signed_integer_to_string(84723450)
