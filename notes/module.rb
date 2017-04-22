# MODULES

=begin

- classes (inheritance) vs. modules (mixins):
  - both contain shared behavior and constants
  - modules:
    - 'has-a' relationships
    - cannot be used to instantiate objects
    - cannot be inherited
      - instead they are mixed in to a class/module by invoking Module#include
        - their instance methods are then available to objects of that class
    - no limit on how many can be mixed in
  - classes:
    - hierarchical ('is-a') relationships
      - for modeling concepts that are naturally hierarchical
    - classes can only have 1 superclass
- Module:
  - 3 uses:
    - 1) a collection of behaviors useable in other classes via mixins
      - group reusable code (common methods) togther into 1 place
        - ex: Swimmable
    - 2) namespacing:
      - organizing similar classes under a module
      - 2 advantages:
        - makes it eaiser to recognize related classes in our code
        - reduces the chance of our classes colliding w/ other similarly named classes in our codebase
      - we can reference classes in a module by appending the class name to the module name w/ 2 colons (::)
    - 3) a container for methods (module methods)
      - using modules to house other methods
      - useful for methods that seem out of place w/ your code
  - another way to apply polymorphic structure to a program
  - another way to DRY up your code (remove duplication)
    - using modules to group common behaviors allows us to build a more powerful, flexible, and DRY design
  - naming convention: often end w/ '-able'
  - mixing in modules affects the method lookup path!

- PROBLEM OF CLASSICAL INHERITANCE:
  - a class can only sub-class from one superclass
    - this limitation makes it difficult to accurately model the problem domain
      - ex: fish are pets that can swim, but can't run or jump
  - Ruby implements multiple inheritance by mixing in modules

=end

# mixin instead of inheritance:
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal
  def eat; end
end

class Fish < Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal
  def run; end
  def jump; end
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in Swimmable module
  def fetch; end
end

class Bulldog < Mammal  # can't swim!
end

 # We don't want to move the swim method into Animal because not all animals swim, and we don't want to create another swim method in Dog because that violates the DRY principle.




 # namespace:
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

# We call classes in a module by appending the class name to the module name with two colons(::)

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak('Arf!')           # => "Arf!"
kitty.say_name('kitty')       # => "kitty"



 # container:
module Mammal
  ...

  def self.some_out_of_place_method(num)
    num ** 2
  end
end

# Defining methods this way within a module means we can call them directly from the module:

value = Mammal.some_out_of_place_method(4)

# We can also call such methods by doing:

value = Mammal::some_out_of_place_method(4)

# although the former is the preferred way.