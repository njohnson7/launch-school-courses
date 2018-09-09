# exercise7.rb
# Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original
#  array by a value of 2.
# You should have 2 arrays at the end of this program, the original array and the new array you've created.
# Print both arrays to the screen using the p method instead of puts.




ary = [1, 2, 3, 4, 5]

# calls map method on ary to increment each element of ary by 2 and saves it to ary_increment variable
ary_increment = ary.map { |num| num + 2 }

# prints out original array and incremented array
p ary
p ary_increment


# Solution 2 - book solution using each/do and <<

new_arr = []        # initialize new array to empty so there's a place to push the values from the do/end block

ary.each do |n|
  new_arr << n + 2        # can also write as:  new_arr.push n + 2
end

p ary
p new_arr