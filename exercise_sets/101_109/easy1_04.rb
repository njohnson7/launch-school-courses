# easy1_04.rb
# What will the following code print, and why?

a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a

# This code will print out 'Xy-zy' because we are passing a into my_value, and
#  this method mutates the caller. Since b is the method parameter, anything we
#  do to b inside of the method that mutates the caller will also affect a. b[2]
#  is element assignment, which replaces the character located at index 2 of b,
#  changing the string to 'Xy-zy'. Element assignment changes the string object
#  it is called on in memory, instead of creating a new string, so a will be
#  permanently altered.
