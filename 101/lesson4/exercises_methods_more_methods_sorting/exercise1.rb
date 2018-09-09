# exercise1.rb

# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end


# the return value is a new array, containing [1, 2, 3] because .select iterates
#  over each element of the array it is called on, and returns a new array
#  containing the elements for which the return value of the block it is given
#  evaluates to a truthiness value. Since the last line in the block is 'hi',
#  the return value of the block will always evaluate to true, and therefore
#  every element will be selected.