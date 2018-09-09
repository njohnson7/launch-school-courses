# easy1_01.rb
# What will the following code print, and why?

a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a

# This code will print out 7 because the my_value method doesn't mutate the
#  argument passed in, so a remains unchanged after calling my_value on it. +=
#  is reassignment, which creates a new object in memory, instead of changing
#  an object.
