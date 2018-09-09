# exercise6.rb
# Get rid of duplicates without specifically removing any one value.



numbers = (0..10).to_a.push(3)

numbers.uniq!       # removes any duplicate elements from numbers array and mutates the caller
p numbers