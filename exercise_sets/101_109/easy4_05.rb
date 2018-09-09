# easy4_05.rb
# Multiples of 3 and 5

# Write a method that computes the sum of all numbers between 1 and some other
#  number that are a multiple of 3 or 5. For instance, if the supplied number is
#  20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Examples

# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

def multisum(num)
  threes_and_fives = (1..num).select { |n| n % 3 == 0 || n % 5 == 0 }
  threes_and_fives.reduce(:+)
end

p multisum(3) #=> 3
p multisum(5) #=> 8
p multisum(10) #=> 33
p multisum(20) #=> 98
p multisum(1000) #=> 234168


# Investigate Enumerable.inject (also known as Enumerable.reduce), How might
#  this method be useful in solving this problem? (Note that Enumerable methods
#  are available when working with Arrays.) Try writing such a solution. Which
#  is clearer? Which is more succint?

# Using reduce is clearer and more succinct.