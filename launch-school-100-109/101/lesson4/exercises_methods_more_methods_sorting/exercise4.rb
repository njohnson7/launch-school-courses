# exercise4.rb

# What is the return value of each_with_object? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end


#  => { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }
# Because .each_with_object iterates through the collection, with a memo object
#  passed in as an argument, which in this case is a hash, and executes the code
#  in the block for each element in relationship to the hash. In this case,
#  the first character of each string at index 0 is assigned as the key of the
#  hash, and the whole string is assigned as the value of that key using element
#  assignment. Once the method finishes its iterations, it returns the hash,
#  which now contains 3 keys and values, one for each element of the original
#  array.