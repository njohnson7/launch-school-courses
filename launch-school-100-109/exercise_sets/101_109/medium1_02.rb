# medium1_02.rb
# Rotation Part 2

# Write a method that can rotate the last n digits of a number.

# Note that rotating just 1 digit leaves the number results in the original
#  number being returned.

# You may use the rotate_array method from the previous exercise if you want.
#  (Recommended!)

def rotate_array(ary)
  ary.map.with_index { |e, i| i == ary.size - 1 ? ary.first : ary[i + 1] }
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_rightmost_digits(num, last_digits)
  num_str = num.to_s
  first_digits = num_str.size - last_digits
  first = num_str[0, first_digits]
  last = num_str[first.size..-1]
  "#{first}#{rotate_string(last)}".to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
p rotate_rightmost_digits(0, 1)
p rotate_rightmost_digits(1234, 2)
p rotate_rightmost_digits(1234, 3)
puts


# Book solution:
def rotate_rightmost_digits(num, last_digits)
  num_ary = num.to_s.chars
  num_ary[-last_digits..-1] = rotate_array(num_ary[-last_digits..-1])
  num_ary.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
p rotate_rightmost_digits(0, 1)
p rotate_rightmost_digits(1234, 2)
p rotate_rightmost_digits(1234, 3)
