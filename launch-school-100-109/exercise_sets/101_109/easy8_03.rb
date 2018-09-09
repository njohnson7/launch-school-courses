# easy8_03.rb
# Leading Substrings

# Write a method that returns a list of all substrings of a string that start at
# the beginning of the original string. The return value should be arranged in
# order from shortest to longest substring.

def substrings_at_start(str)
  substrings = []
  1.upto(str.size) { |length| substrings << str[0, length] }
  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
puts


# Alternate solution:
def substrings_at_start(str)
  str.chars.each_with_object([]).with_index { |(_, a), idx| a << str[0..idx] }
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
puts


# Alternate solution 2:
def substrings_at_start(str)
  substrings = []
  str.size.times { |length| substrings << str.match(/^.{1,#{length + 1}}/).to_s }
  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
