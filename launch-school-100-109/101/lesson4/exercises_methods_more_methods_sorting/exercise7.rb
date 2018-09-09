# exercise7.rb

# What is the block's return value in the following code? How is it determined?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end


# => true
# .any? passes each element of the collection to the block, executing the code
#  in the block upon each iteration, and checks whether the block's return value
#  evaluates to true. If it does, then the method stops iterating immediately,
#  and returns true itself. If the block never evaluates to true, then the
#  method will return false. In this case, the first element is 1, so the method
#  outputs 1, then the last line of the block, num.odd?, returns true, so the
#  method stops iterating and returns true. Therefore the only element that gets
#  output is 1.