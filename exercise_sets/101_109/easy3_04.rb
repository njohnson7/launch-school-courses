# easy3_04.rb
# Multiplying Two Numbers

# Create a method that takes two arguments, multiplies them together, and
#  returns the result.

# Example:

# multiply(5.2, 3) == 15.6

def multiply(num1, num2)
  num1 * num2
end

p multiply(5.2, 3) #=> 15.6
p multiply('yo', 3)
p multiply(5, 2)
p multiply([1,2,3], 3)
p multiply(%w(bob tom fred), 3)
