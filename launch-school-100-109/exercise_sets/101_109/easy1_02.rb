# easy1_02.rb
# What will the following code print, and why?

a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a

# This code will print out 7, as in the previous exercise, for the same reasons.
#  The only thing that changed is that the parameter for my_value is now called
#  a instead of b. Because methods have their own variable scope, method
#  parameters can have any name and it doesn't make a difference to their
#  function.
