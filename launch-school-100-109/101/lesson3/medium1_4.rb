# medium1_4.rb

# What happens when we modify an array while we are iterating over it?

# Unpredictable things can happen if we modify an array while we are iterating
# over it. What will happen depends on the methods and variables used.
# In the above array,


# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# This code will print out 1 and 3 (on separate lines), and the original numbers
# array will be modified to: [3, 4]. This is because the first iteration, 1 will
# be printed out, then the first element of numbers array will be removed (1).
# The numbers array is now: [2, 3, 4]
# The second iteration will act on index 1 of the numbers array, which now
# contains the element 3, since the element 1 has been removed. So 3 will be
# printed out, and the first element of the numbers array, 2, will be removed.
# The numbers array is now: [3, 4]
# Since the numbers array now only has 2 indexes, the .each method won't
# iterate again, since it already iterated over index 0 and index 1.


# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# This code will print out:
# 1
# 2
# The original numbers array will be modified to: [1, 2]
# This is because the first iteration will print out the number at index 0
# of the array, 1, and then remove the last element, 4, leaving the array as:
# [1, 2, 3]
# The second iteration will print out the number at the index 1 of the array,
# 2, and then remove the last element, 3, leaving the array as: [1, 2]
# Since the array only has a length of 2 now, then the each method has finished
# iterating through all its indexes, so it won't run another iteration.
