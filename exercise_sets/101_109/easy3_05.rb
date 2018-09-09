# easy3_05.rb
# Squaring an Argument

# Using the multiply method from the "Multiplying Two Numbers" problem, write a
#  method that computes the square of its argument (the square is the result of
#  multiplying a number by itself).

# Example:

# square(5) == 25
# square(-8) == 64

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square(5) #=> 25
p square(-8) #=> 64
puts


# What if we wanted generalize this method to a "power to the n" type method:
#  cubed, to the 4th power, to the 5th, etc. How would we go about doing so
#  while still using the multiply method?

def power_of(num, power)
  result = num
  while power > 1
    result = multiply(result, num)
    power -= 1
  end

  result
end

p power_of(2, 2)
p power_of(2, 3)
p power_of(2, 4)
p power_of(2, 5)
p power_of(2, 6)
p power_of(2, 7)
puts
p power_of(3, 2)
p power_of(3, 3)
p power_of(3, 4)
puts
p power_of(4, 2)
p power_of(4, 3)
p power_of(5, 2)
p power_of(5, 3)
p power_of(6, 2)
p power_of(7, 0)
p power_of(7, 1)
p power_of(7, 2)
p power_of(7, 3)
