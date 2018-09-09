# exercise9.rb

# What is the return value of map? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, 'bear']
# because .map runs the block for each element in the collection, returning a
#  new array in which each element is the return value of the block. In this
#  case, .map is called on a hash, so it runs the block once for each key-value
#  pair in the hash. On the first iteration, the size of the value, 'ant', is
#  not greater than 3, so the code in the if conditional doesn't get executed,
#  and since there is no other code in the block, the block returns nil.
#  Therefore, the first element in the hash is transformed to nil, which gets
#  added as the first element in the returned array. In the next iteration, the
#  value is 'bear', which returns 4 when size is called on it, and since 4 is
#  greater than 3, the code under the if condition is executed, and since there
#  is no other code in the block, the return value of block is the value 'bear'.
#  Therefore, .map transforms the key-value pair to 'bear' and adds it to the
#  returned array. Since there are no more elements left in the hash to iterate
#  over, .map is finished executing and returns the completed new array.