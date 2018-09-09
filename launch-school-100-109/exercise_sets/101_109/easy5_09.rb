# easy5_09.rb
# ddaaiillyy ddoouubbllee

# Write a method that takes a string argument and returns a new string that
#  contains the value of the original string with all consecutive duplicate
#  characters collapsed into a single character.

def crunch(str)
  str.squeeze
end

p crunch('ddaaiillyy ddoouubbllee') #=> 'daily double'
p crunch('4444abcabccba') #=> '4abcabcba'
p crunch('ggggggggggggggg') #=> 'g'
p crunch('a') #=> 'a'
p crunch('') #=> ''
p crunch('mississippi issss ttthe beeeest')
puts


# Alternate solution:
def crunch(str)
  result = ''
  str.each_char.with_index { |c, idx| result << c unless str[idx + 1] == c }

  result
end

p crunch('ddaaiillyy ddoouubbllee') #=> 'daily double'
p crunch('4444abcabccba') #=> '4abcabcba'
p crunch('ggggggggggggggg') #=> 'g'
p crunch('a') #=> 'a'
p crunch('') #=> ''
p crunch('mississippi is the beest')
puts


# You may have noticed that we continue iterating until index points past the
# end of the string. As a result, on the last iteration text[index] is the last
# character in text, while text[index + 1] is nil. Why do we do this? What
# happens if we stop iterating when index is equal to text.length - 1?

# Can you determine why we didn't use each_char or chars to iterate through the
# string? How would you modify this method to use each_char or chars?

# You may have been tempted to use uniq or squeeze. If either of those are used,
# then non-consecutive duplicates will get removed from the text as well. This
# way, we only get rid of consecutive duplicates, the non-consecutive duplicate
# characters are kept in place.

# It is possible to solve this using regular expressions (see the Regexp module
# documentation). For a nice challenge, give this a try with regular
# expressions. Can you think of other solutions besides regular expressions?


def crunch(str)
  result = ''
  str.chars.each_with_index { |c, idx| result << c unless str[idx + 1] == c }

  result
end

p crunch('ddaaiillyy ddoouubbllee') #=> 'daily double'
p crunch('4444abcabccba') #=> '4abcabcba'
p crunch('ggggggggggggggg') #=> 'g'
p crunch('a') #=> 'a'
p crunch('') #=> ''
p crunch('mississippi is the beest')
puts


# Alternate solution 2:
def crunch(str)
  two_consecutive_chars = /(.)\1/
  while str =~ two_consecutive_chars
    str.slice!(two_consecutive_chars, 1)
  end

  str
end

p crunch('ddaaiillyy ddoouubbllee') #=> 'daily double'
p crunch('4444abcabccba') #=> '4abcabcba'
p crunch('ggggggggggggggg') #=> 'g'
p crunch('a') #=> 'a'
p crunch('') #=> ''
p crunch('mississippi is the beest')
puts


# Alternate solution 3:
def crunch(str)
  str.chars.chunk { |c| c }.map(&:first).join
end

p crunch('ddaaiillyy ddoouubbllee') #=> 'daily double'
p crunch('4444abcabccba') #=> '4abcabcba'
p crunch('ggggggggggggggg') #=> 'g'
p crunch('a') #=> 'a'
p crunch('') #=> ''
p crunch('mississippi is the beest')
puts


# Alternate solution 4:
def crunch(str)
  result = ''
  str.chars.reduce('') do |memo, c|
    result << c unless c == memo
    c
  end

  result
end

p crunch('ddaaiillyy ddoouubbllee') #=> 'daily double'
p crunch('4444abcabccba') #=> '4abcabcba'
p crunch('ggggggggggggggg') #=> 'g'
p crunch('a') #=> 'a'
p crunch('') #=> ''
p crunch('mississippi is the beest')
puts
