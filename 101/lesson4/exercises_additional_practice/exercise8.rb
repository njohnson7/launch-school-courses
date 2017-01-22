# exercise8.rb

# What happens when we modify an array while we are iterating over it? What
# would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# This code will output 1 and 3 because the first iteration starts at the first
#  element in numbers, which is 1, outputs that, then takes off that element
#  by calling the .shift method on numbers. Then the second iteration starts,
#  which is now at index 1, and since numbers has been mutated to [2, 3, 4],
#  the number 3 is now at index 1, so 3 will be ouput, then .shift will take
#  off the first element of numbers again, which mutates it [3, 4]. The next
#  iteration would have started at index 2, but since index 2 is now out of
#  bounds in the size 2 numbers array, the iteration stops. Then .each will
#  return the numbers array it was called on, which is now [3, 4].




# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end


# This code will output 1 and 2, and return [1, 2] for the same reasons
#  mentioned in the above explanation, with the only difference being that
#  instead of .shift removing the first element of the numbers array, causing
#  elements in between to be skipped, .pop removes the last element from the
#  array 2 times, so only the first two elements are output and returned.