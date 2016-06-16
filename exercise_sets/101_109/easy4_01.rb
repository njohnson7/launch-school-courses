# easy4_01.rb
# Short Long Short

# Write a method that takes two strings as arguments, determines the longest of
#  the two strings, and then returns the result of concatenating the shorter
#  string, the longer string, and the shorter string once again. You may assume
#  that the strings are of different lengths.

# Examples:

# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

def short_long_short(str1, str2)
  short, long = [str1, str2].sort_by(&:size)
  short + long + short
end


p short_long_short('abc', 'defgh') #== "abcdefghabc"
p short_long_short('abcde', 'fgh') #== "fghabcdefgh"
p short_long_short('', 'xyz') #== "xyz"
p short_long_short('aaa', 'bb')
p short_long_short('yo', 'yo')
puts


# Alternate solution:
def short_long_short(str1, str2)
  str1.size > str2.size ? str2 + str1 + str2 : str1 + str2 + str1
end


p short_long_short('abc', 'defgh') #== "abcdefghabc"
p short_long_short('abcde', 'fgh') #== "fghabcdefgh"
p short_long_short('', 'xyz') #== "xyz"
p short_long_short('aaa', 'bb')
p short_long_short('yo', 'yo')
