# exercise5.rb
# Get rid of "11".
# Append a "3".


numbers = (0..11).to_a

numbers.pop       # removes 11
numbers << 3        # appends 3 at the end

p numbers


# or to insert the 3 next to the other 3 at index 3:
numbers.insert(3, 3)

p numbers