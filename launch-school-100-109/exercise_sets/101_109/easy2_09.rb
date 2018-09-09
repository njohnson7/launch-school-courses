# easy2_09.rb
# String Assignment

# Take a look at the following code:

# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name

# What does this code print out? Think about it for a moment before continuing.

# If you said that code printed

# Alice
# Bob

# you are 100% correct, and the answer should come as no surprise. Now, let's
#  look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain these results?

# This will print out:
# BOB
# BOB

# This is because we are calling the upcase! method on name, which mutates the
#  caller, (it alters the object that the variable is pointing to), and since
#  name and save_name both reference the same object, then mutating either one
#  of them will mutate both of them.
