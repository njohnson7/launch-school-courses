# METHOD LOOKUP

=begin

- method lookup path:
  - an ordered list of classes/modules that Ruby traverses to find and invoke a method when that method is called.
- call Module#ancestors on any class to see the method lookup chain
- included modules are inserted above the including class in the chain.
  - reverse order of inclusion.
- modules mixed into superclasses are also included in the lookup path
- every path ends in Object, Kernel, BasicObject b/c every class inherently inherits from Object

=end



# ---GoodDog method lookup---
# GoodDog
# Climbable
# Swimmable
# Animal
# Walkable
# Object
# Kernel
# BasicObject