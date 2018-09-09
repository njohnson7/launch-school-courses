# easy1_07.rb

# What is the default thing that Ruby will print to the screen if you call to_s
# on an object? Where could you go to find out if you want to be sure?

# Object#to_s can be called on any object, but often it is overridden to
#  provide more specific functionality. It does not print anything to the
#  screen, but rather returns a string representation of the object that it is
#  called on. If Object#to_s is not overridden by an instance method of a child
#  of object, then it will return a string containing the object's class, as
#  well as an encoding of the object id. The only exception to this rule is
#  if we call .to_s on main in the initial execution #  context of a Ruby program.
# To be sure of this behavior, you could consult ruby-doc.org, and look up
#  Object#to_s.
