# easy8_04.rb
# All Substrings

# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This means
# that all substrings that start at position 0 should come first, then all
# substrings that start at position 1, and so on. Since multiple substrings will
# occur at each position, the substrings at a given position should be returned
# in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the
# previous exercise:

def substrings_at_start(str)
  substrings = []
  1.upto(str.size) { |length| substrings << str[0, length] }
  substrings
end

def substrings(str)
  all_substrings = []
  0.upto(str.size - 1) do |start|
    all_substrings += substrings_at_start(str[start..-1])
  end
  all_substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p substrings('cat')
p substrings('')
puts


# Alternate solution:
def substrings(str)
  all_substrings = []
  until str.empty?
    all_substrings += substrings_at_start(str)
    str[0] = ''
  end
  all_substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p substrings('cat')
p substrings('')
puts


# Alternate solution 2:
def substrings(str)
  all_substrings = []
  0.upto(str.size - 1) do |size|
    current_substring = str.match(/(.{#{size}})(.{#{str.size - size}})/)[2]
    all_substrings.concat(substrings_at_start(current_substring))
  end
  all_substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p substrings('cat')
p substrings('')
puts


# Alternate solution 3:
def substrings(str)
  str.chars.each_with_object([]).with_index do |(_, a), i|
    a.concat(substrings_at_start(str[i..-1]))
  end
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p substrings('cat')
p substrings('')
