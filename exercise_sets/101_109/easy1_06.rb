# easy1_06.rb
# What will the following code print, and why?

a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a

# This code will result in a NameError. It won't even run the 'puts a' line.
#  This is because methods have their own variable scope, so a method cannot
#  access any variables initialized outside of it, unless those variables are
#  passed in as arguments. Since the my_value method only takes one argument, b,
#  and when we are calling it, we are passing in a, b and a are both referencing
#  the same object in memory. Therefore the only variable that my_value has
#  access to is b. It doesn't know what a is. So this results in a NameError.
