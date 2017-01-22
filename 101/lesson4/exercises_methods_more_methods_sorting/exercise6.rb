# exercise6.rb

# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size


# => 11
# Because .pop destructively removes the last element of the receiver array and
#  returns that element, which is the string 'caterpillar' in this case. Then
#  .size is called on this returned string via method chaining, and returns
#  the length of the string, which is 11 in this case.