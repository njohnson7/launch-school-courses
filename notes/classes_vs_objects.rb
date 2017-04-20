=begin

- Classes are like a basic outline, or blueprint, that defines:
  - what an object should be made of (its state/ivars/attributes)
  - what an object should be able to do (behaviors/methods)
- Objects are instantiated (or created) from classes
- Different objects of the same class:
  - unique states/ivars
    - can differ both in which / how many ivars are defined, and their values
  - share the same behaviors
    - methods of the object are the instance methods of its class
- Calling Object#class on an object returns the name of its class
- Define a class by:
  - class keyword
  - name of class (constant in CamelCase naming convention)
  - end keyword finishes the definition
- Ruby file names should be in snake_case and reflect the class name





- Classes are objects too, instances of the class Class

=end

#good_dog.rb
class GoodDog
end

sparky = GoodDog.new
# We instantiate an object called sparky from the class GoodDog
# Calling the class method new returns a new object