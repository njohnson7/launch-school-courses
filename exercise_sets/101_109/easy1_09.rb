# easy1_09.rb
# What will the following code print, and why?

a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

# This code will print out 10 because we are iterating through the array 3
#  times, since it has 3 elements, and during each iteration we are incrementing
#  a by 1, so by the end of the Array#each call, a is equal to 10.

# Actually the above answer is wrong. It would be right if the block argument
#  were called something besides a, but I didn't notice that it had the same
#  name as the top level a. This is a case of variable shadowing, when 2
#  different variables, used in different scopes, have the same name. In this
#  type of situation, the block argument variable will always take precedence
#  over any other variables with the same name, so in the Array#each call, we
#  are incrementing each element in the array by 1, since a is pointing to each
#  element in the array in this case. Therefore, we aren't doing anything to the
#  top level a, so it will print out 7.
