# easy1_05.rb
# What will the following code print, and why?

a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a

# This code will print out the original value of a, 'Xyzzy'. This is because
# we are passing in a to the my_value method, which takes the parameter b. So a
# and b are both pointing to the same object. The 'b = ...' line in the method
# is reassignment, which doesn't mutate the caller, so a remains unchanged when
# we print it out.
