# easy5_01.rb
# ASCII String Value

# Write a method that determines and returns the ASCII string value of a string
#  that is passed in as an argument. The ASCII string value is the sum of the
#  ASCII values of every character in the string. (You may use String#ord to
#  determine the ASCII value of a character.)

def ascii_value(str)
  str.chars.reduce(0) { |sum, char| sum += char.ord }
end

p ascii_value('Four score') #=> 984
p ascii_value('Launch School') #=> 1251
p ascii_value('a') #=> 97
p ascii_value('') #=> 0
puts


# Alternate solution:
def ascii_value(str)
  str.codepoints.reduce(0, :+)
end

p ascii_value('Four score') #=> 984
p ascii_value('Launch School') #=> 1251
p ascii_value('a') #=> 97
p ascii_value('') #=> 0


# There is a String method such that:

# char.ord.mystery == char

# where mystery is our mystery method. Can you determine what method name
#  should be used in place of mystery? What happens if you try this with a
#  longer string instead of a single character?

# The method is Str#chr.
# If you try this with a longer string, it will just return the first character
#  of the string.
