# exercise10.rb
# Can hash values be arrays? Can you have an array of hashes?



# Yes, hash values can be arrays. Here is an example:
hash = { array1: [1, 2, 3], array2: [4, 5, 6] }
p hash


# Yes, you can have an array of hashes. Here is an example:
array = [ {one: 1, two: 2, three: 3}, {four: 4, five: 5, six: 6} ]
p array



# BOOK SOLUTION EXAMPLES:

# hash values as arrays
hash = {names: ['bob', 'joe', 'susan']}

# array of hashes
arr = [{name: 'bob'}, {name: 'joe'}, {name: 'susan'}]