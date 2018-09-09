# exercise10.rb

# What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil]
# Because .map transforms an array based on the evaluated result of the given
#  block, so on the first iteration, 1 is not greater than 1, so the code under
#  the else condition is executed, returning the same element that was passed
#  in, which is 1, so 1 is added to the new returned array without being
#  transformed. For the next 2 iterations, the elements 2 and 3 are both greater
#  than 1, so the code under the if condition is executed, outputting 2 and 3,
#  and returning nil both times. Therefore, the elements 2 and 3 get transformed
#  to nil before being added to the new array.