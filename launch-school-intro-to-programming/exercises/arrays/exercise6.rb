# exercise6.rb
# How to fix error message from running the following code?


names = ['bob', 'joe', 'susan', 'margaret']

# error code:

# names['margaret'] = 'jody'
# TypeError: no implicit conversion of String into Integer


# The problem is that when calling the [] method on an array, the argument inside the brackets must be an integer referring to an index
#  value, but in this case it contains the value of an element in the array. Therefore the compiler is expecting an integer, but it
#  is instead seeing a string, so it causes an error.


# Fix by replacing the string 'margaret' with its index value of 3
names[3] = 'jody'       # changes "margaret" to "jody"


# BOOK NOTES:
# You are attempting to set the value of an item in an array using a string as the key.
#  Arrays are indexed with integers, not strings
# We access arrays through its index, which is an integer