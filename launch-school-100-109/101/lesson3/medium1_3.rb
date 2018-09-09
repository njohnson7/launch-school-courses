# medium1_3.rb
# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?


# It will give a 'TypeError: no implicit conversion of Fixnum into String'
# because the code is trying to add a string to an integer. (40 + 2) is 42, an
# integer, and 'the value of 40 + 2 is ' is a string. Strings cannot be added to
# integers using the '+' operator because they are two entirely different
# classes, so Ruby doesn't know how to combine them.

# One way to fix this is by converting (40 + 2) into a string, and then use
# string concatenation, to combine the 2 strings together:
puts 'the value of 40 + 2 is ' + (40 + 2).to_s

# Another way to fix this is using string interpolation:
puts "the value of 40 + 2 is #{40 + 2}"
