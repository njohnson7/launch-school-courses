# easy1_07.rb
# What will the following code print, and why?

a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# This code will print out 3, because we are iterating through the array,
#  [1, 2, 3], each time reassigning a to the value of current element of the
#  array. Since the last element of the array is 3, a will be reassigned to the
#  value of 3 during the last iteration of Array#each. Therefore when we print
#  out a, it will print out the updated value of 3.
