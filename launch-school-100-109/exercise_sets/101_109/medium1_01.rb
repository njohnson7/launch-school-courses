# medium1_01.rb
# Rotation Part 1

# Write a method that rotates an array by moving the first element to the end of
#  the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for you implementation.

def rotate_array(ary)
  return ary if ary.empty?
  ary[1..-1] + [ary.first]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
p rotate_array([])
puts


# Alternate solution:
def rotate_array(ary)
  ary.map.with_index { |e, i| i == ary.size - 1 ? ary.first : ary[i + 1] }
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']


x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
p rotate_array([])
puts



# Write a method that rotates a string instead of an array. Do the same thing
#  for integers. You may use rotate_array from inside your new method.

def rotate_string(str)
  rotate_array(str.chars).join
end

p rotate_string('bobloblaw')
p rotate_string('abc')
p rotate_string('735291')
p rotate_string('123')
p rotate_string('12')
p rotate_string('1')
p rotate_string('0')
p rotate_string('1200')
p rotate_string('b')
p rotate_string('')
puts


def rotate_integer(num)
  rotate_array(num.to_s.chars).join.to_i
end

p rotate_integer(735291)
p rotate_integer(123)
p rotate_integer(12)
p rotate_integer(1)
p rotate_integer(0)
p rotate_integer(1200)
