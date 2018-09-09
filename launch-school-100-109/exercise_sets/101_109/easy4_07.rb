# easy4_07.rb
# Convert a String to a Number!

# The String#to_i method converts a string of numeric characters (including an
#  optional plus or minus sign) to an Integer. String#to_int and Integer behave
#  similarly. In this exercise, you are going to create your own conversion
#  method.

# Write a method that takes a String of digits, and returns the appropriate
#  number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about
#  invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, such
#  as String#to_i, Integer(), etc. It should do this the old-fashioned way and
#  calculate the result by analyzing the characters in the string.

# Examples:

# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

def string_to_integer(str)
  eval(str)
end

p string_to_integer('4321') #=> 4321
p string_to_integer('570') #=> 570
puts


# Alternate solution:
STRING_TO_NUM = %w(0 1 2 3 4 5 6 7 8 9)

def string_to_integer(str)
  number = 0
  nums = str.chars.map { |char, idx| STRING_TO_NUM.index(char) }.reverse
  nums.each_with_index { |n, idx| number += n * (10**idx) }

  number
end

p string_to_integer('4321') #=> 4321
p string_to_integer('570') #=> 570
puts


# Alternate solution 2:
def string_to_integer(str)
  nums = str.chars.map { |char, idx| STRING_TO_NUM.index(char) }.reverse
  nums.map.with_index { |n, idx| n * (10**idx) }.reduce(:+)
end

p string_to_integer('4321') #=> 4321
p string_to_integer('570') #=> 570
puts


# Alternate solution 3:
def string_to_integer(str)
  str.chars.reverse.map.with_index do |char, idx|
    STRING_TO_NUM.index(char) * (10**idx)
  end.reduce(:+)
end

p string_to_integer('4321') #=> 4321
p string_to_integer('570') #=> 570
puts


# Book solution:
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

p string_to_integer('4321') #=> 4321
p string_to_integer('570') #=> 570
puts


# Write a hexadecimal_to_integer method that converts a string representing a
#  hexadecimal number to its integer value.

# Example:

# hexadecimal_to_integer('4D9f') == 19871

STR_TO_HEX = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'a' => 10,
  'b' => 11,
  'c' => 12,
  'd' => 13,
  'e' => 14,
  'f' => 15
}

def hexadecimal_to_integer(str)
  number = 0
  nums = str.downcase.chars.map { |char| STR_TO_HEX[char] }
  nums.each { |n| number = number * 16 + n }

  number
end

p hexadecimal_to_integer('4D9f') #=> 19871
p hexadecimal_to_integer('3AB')
p hexadecimal_to_integer('A1A1')
p hexadecimal_to_integer('5000')
p hexadecimal_to_integer('500D')
p hexadecimal_to_integer('18A2F')
