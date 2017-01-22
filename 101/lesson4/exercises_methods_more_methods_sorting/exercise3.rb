# exercise3.rb

# What is the return value of reject? Why?

[1, 2, 3].reject do |num|
  puts num
end


# the return value is [1, 2, 3] because reject passes every element in the
#  collection to the given block, and returns a new array containing the
#  elements for which the block doesn't return a true value. In this case, since
#  puts is the last line of the block, the block will always return nil, and
#  therefore all the original elements will be in the new array because none of
#  them caused the block to return a true value when passed in.