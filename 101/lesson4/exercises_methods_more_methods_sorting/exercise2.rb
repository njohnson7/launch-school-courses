# exercise2.rb

# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end


# .count iterates through each element in a collection, passing the element to
#  the given block, and counts the number of times the block's return value
#  evaluates to true. We can find this out by reading the docs or testing it in
#  irb.