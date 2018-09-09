# Exercise 1


# Solution 1

# Declare variables for first and last name
firstname = "Nick "
lastname = "Johnson"

# Concatenate first and last name variables to return full name in one string
firstname + lastname  # Returns "Nick Johnson"
puts firstname + lastname  # Prints "Nick Johnson", but returns nil


# Solution 2
# Putting a space character in a separate string, instead of within the firstname variable string

# Declare variables
firstname2 = "Nick"
lastname2 = "Johnson"

# Concatenate variables with a string containing a space character
firstname2 + " " + lastname2  # Returns "Nick Johnson"
puts firstname2 + " " + lastname2  # Prints "Nick Johnson", but returns nil


# Solution 3
# Concatenate both names using two strings, without using variables

"Nick " + "Johnson"  # Returns "Nick Johnson"
puts "Nick " + "Johnson"  # Prints "Nick Johnson", but returns nil


# Solution 4
# Use interpolation to concatenate two variables by merging them within a single string

# Declare variables
firstname4 = "Nick"
lastname4 = "Johnson"

"#{firstname4} #{lastname4}"  # Returns "Nick Johnson"
puts "#{firstname4} #{lastname4}"  # Prints "Nick Johnson" to screen, but returns nil