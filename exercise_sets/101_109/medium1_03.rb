# medium1_03.rb
# Rotation Part 3

# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining
# digits, you get 329175. Keep the first 2 digits fixed in place and rotate
# again to 321759. Keep the first 3 digits fixed in place and rotate again to
# get 321597. Finally, keep the first 4 digits fixed in place and rotate the
# final 2 digits to get 321579. The resulting number is called the maximum
# rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum
# rotation of that argument. You can (and probably should) use the
# rotate_rightmost_digits method from the previous exercise.
def rotate_array(ary)
  ary.map.with_index { |e, i| i == ary.size - 1 ? ary.first : ary[i + 1] }
end

def rotate_rightmost_digits(num, last_digits)
  num_ary = num.to_s.chars
  num_ary[-last_digits..-1] = rotate_array(num_ary[-last_digits..-1])
  num_ary.join.to_i
end

def max_rotation(num)
  num.to_s.size.downto(2) { |idx| num = rotate_rightmost_digits(num, idx) }
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
puts


# Assume you do not have the rotate_rightmost_digits or rotate_array methods.
# How would you approach this problem? Would your solution look different? Does
# this 3 part approach make the problem easier to understand or harder?

def max_rotation(num)
  num_str = num.to_s
  num_str.size.downto(2) do |idx|
    num_str[-idx..-1] = num_str[-idx + 1..-1] + num_str[-idx]
  end
  num_str.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# The solution is a little different in that I didn't use arrays this time.
#  Other than that it's pretty similar, but just with the one method being kind
#  of a combination of the three methods. The three part approach makes the
#  problem a little easier to understand.
