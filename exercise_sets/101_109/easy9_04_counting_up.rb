# easy9_04_counting_up.rb
# Counting Up

# Write a method that takes an integer argument, and returns an Array of all
# integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is
# greater than 0.

def sequence(num)
  (1..num).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
puts


# Food for thought: what do you think sequence should return if the argument is
# not greater than 0. For instance, what should you do if the argument is -1?
# Can you alter your method to handle this case?
def sequence(num)
  num > 0 ? (1..num).to_a : (num..1).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(0)
p sequence(-1)
p sequence(-10)
