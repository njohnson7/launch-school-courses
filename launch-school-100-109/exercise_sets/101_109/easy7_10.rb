# easy7_10.rb
# The End is Near But Not Here

# Write a method that returns the next to last word in the String passed to it
#  as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
p penultimate('This is a test') == 'a'
puts


# Alternate solution:
def penultimate(str)
  str.reverse.match(/(\S+)\s+(\S+)/)[2].reverse
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
p penultimate('This is a test') == 'a'
puts


# Alternate solution 2:
def penultimate(str)
  str.match(/(\S+)\s+(\S+$)/)[1]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
p penultimate('This is a test') == 'a'
puts


# Our solution ignored a couple of edge cases because we explicitly stated that
# you didn't have to handle them: strings that contain just one word, and
# strings that contain no words.

# Suppose we need a method that retrieves the middle word of a phrase/sentence.
# What edge cases need to be considered? How would you handle those edge cases
# without ignoring them? Write a method that returns the middle word of a phrase
# or sentence. It should handle all of the edge cases you thought of.

# Returns middle word or the word right before the middle if there are an even
#  number of words in the string.
def middle_word(str)
  return str if str.empty?
  words = str.split
  middle_index = words.size / 2
  middle_index -= 1 if words.size.even?
  words[middle_index]
end

p middle_word('last word') == 'last'
p middle_word('Launch School is great!') == 'School'
p middle_word('Launch School is the greatest!') == 'is'
p middle_word('This is a test') == 'is'
p middle_word('This is a test yo') == 'a'
p middle_word('word') == 'word'
p middle_word('') == ''
puts
