# TO_S

=begin

- all classes inherit #to_s from Object
- to_s is automatically called on (used implicitly):
  - expressions interpolated into strings
  - arguments passed in to puts
- by default, Object#to_s returns a string containing the object's class and an encoding of the object id
  - we can override this by defining a custom to_s method in a class
    - so it returns a more human-readable (user-friendly) string
- p calls inspect on its argument(s) instead of to_s
  - useful for debugging, so don't override
  - returns its arguments instead of nil

=end

# default
# puts
# string interpolation
# explicit