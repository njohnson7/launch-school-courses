# exercise4.rb
# Append "11" to the end of the original array.
# Prepend "0" to the beginning.



numbers = (1..10).to_a

numbers.push(11)        # appends 11 to end of numbers array
numbers.unshift(0)        # prepends 0 to beginning of numbers array

p numbers