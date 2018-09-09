# easy1_03.rb

# What will the following code print, and why?

a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a

# This code will print out 7 because my_value doesn't mutate the caller. It just
#  reassigns the value passed in, 12, to the variable a. Since methods are
#  self-contained with respect to local variables, the a in the my_value method
#  has no relationship or effect on the top level a. Variables in a method are
#  not visible outside of the method.
