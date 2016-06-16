# easy4_08.rb
# Convert a String to a Signed Number!

# In the previous exercise, you developed a method that converts simple numeric
#  strings to Integers. In this exercise, you're going to extend that method to
#  work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate
#  number as an integer. The String may have a leading + or - sign; if the
#  first character is a +, your method should return a positive number; if it
#  is a -, your method should return a negative number. If no sign is given,
#  you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such
#  as String#to_i, Integer(), etc. You may, however, use the string_to_integer
#  method from the previous lesson.

# Examples:

# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

STRING_TO_NUM = %w(0 1 2 3 4 5 6 7 8 9)

def string_to_integer(str)
  str.chars.reverse.map.with_index do |char, idx|
    STRING_TO_NUM.index(char) * (10**idx)
  end.reduce(:+)
end

def string_to_signed_integer(str)
  num = string_to_integer(str.delete('^0-9'))
  str.start_with?('-') ? -num : num
end

p string_to_signed_integer('4321') #=> 4321
p string_to_signed_integer('-570') #=> -570
p string_to_signed_integer('+100') #=> 100
p string_to_signed_integer('+632213')
p string_to_signed_integer('-878923')
p string_to_signed_integer('45787')
puts


# In our solution, we call string[1..-1] twice, and call string_to_integer
 # three times. This is somewhat repetitive. Refactor our solution so it only
 # makes these two calls once each.

def string_to_signed_integer(str)
  str.insert(0, '+') if str[0] =~ /\d/
  num = string_to_integer(str[1..-1])
  str.start_with?('-') ? -num : num
end

p string_to_signed_integer('4321') #=> 4321
p string_to_signed_integer('-570') #=> -570
p string_to_signed_integer('+100') #=> 100
p string_to_signed_integer('+632213')
p string_to_signed_integer('-878923')
p string_to_signed_integer('45787')
