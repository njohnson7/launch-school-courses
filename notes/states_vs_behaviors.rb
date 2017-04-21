# STATES VS. BEHAVIOR

=begin

- states track attributes for individual objects: ivars
  - unique to every object (even instances of the same class)
    - (which ones / how many are defined, and values)
  - scoped at the object (instance) level
    - exist for as long as the object instance exists
  - ivars are one way of tying data to objects
  - syntax:  @ character, snake_case
- behaviors are what objects are capable of doing: methods
  - shared b/w all objects/instances of the same class
  - methods of an object are the instance methods defined in its class
  - instance methods expose behavior for objects

=end

# we can expose information about the state of the object using instance methods:
def speak
  "#{@name} says arf!"
end
# all objects of the same class have the same behaviors, though they contain different states; here, the differing state is the name.
puts sparky.speak           # => "Sparky says arf!"
puts fido.speak             # => "Fido says arf!"
