# SELF

=begin

- self keyword is used to specify a certain scope for our program
  - it is a way to be explicit about:
    - what our program is referencing
    - what our intentions are in regards to behavior
- what it refers to depends on where it is used (the scope it is defined in)
  - w/i an instance method definition:
    - references the receiver (the instance/obj that the method was called on)
  - w/i a class def, but outside of an instance method:
    - references the class
- 2 main use cases:
  - when calling setter methods from w/i a class
    - necessary so that Ruby can disambiguate syntax from initializing a local var
  - class method definitions
    - prepend self. to name of method in a method definition
    - defines the method on the class
      - ex: self.class_method   ==    GoodDog.class_method

=end

# what is self instance method (returns self)
# self.name=  is equivalent to   sparky.name=

class GoodDog
  puts self
end

# define a class method w/ self and w/ class name
  # ex: self.class_method   ==    GoodDog.class_method