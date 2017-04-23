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

# NAMESPACE:
module SmartPhone
  class Kernel
    def self.regulate_cpu_speed
      'Regulating CPU speed...'
    end
  end

  class File
    def self.open(file_name)
      'Opening file...'
    end

    def path
      "this is my path..."
    end
  end
end

Kernel.regulate_cpu_speed rescue $!
# ==> #<NoMethodError: undefined method `regulate_cpu_speed' for Kernel:Module>
SmartPhone::Kernel.regulate_cpu_speed
# ==> "Regulating CPU speed..."

File.file?('abc')
# ==> false
SmartPhone::File.file?('abc') rescue $!
# ==> #<NoMethodError: undefined method `file?' for SmartPhone::File:Class>

# we reference classes nested in a Module using the scope resolution operator:
a_file = SmartPhone::File.new
a_file.path                    # ==> "this is my path..."




# CONTAINER for out of place methods:
module Fibonacci
  def self.first_five
    [1, 1, 2, 3, 5]
  end
end

Fibonacci.first_five  # ==> [1, 1, 2, 3, 5]





# MULTIPLE INHERITANCE PROBLEMS:

class Phone
  def call
    'calling...'
  end
end

# defining #charge in 2 places violates the DRY principle.
class SmartPhone < Phone
  def charge
    'charging...'
  end
end

class ElectricToothbrush
  def charge
    'charging...'
  end
end


# fix by extracting charging behavior to a module:
module Chargeable
  def charge
    'charging...'
  end
end

module Bluetooth
  def pair
    'bluetooth pairing...'
  end
end

class Phone
  def call
    'calling...'
  end
end

# SmartPhone inherits from Phone, but a regular Phone cannot be charged and does
# not have Bluetooth, so by mixing in these two modules SmartPhone can share the
# behaviors of #charge and #pair without having to define them directly in the
# class definition. So SmartPhone effectively 'inherits' behavior from at least
# 3 different places.
class SmartPhone < Phone
  include Chargeable
  include Bluetooth
end

# An ElectricToothbrush can be charged, but does not have Bluetooth, so here we
# only need to mix in the Chargeable module. Without this mixin, we would have
# to define #charge twice, once in each class definition.
class ElectricToothbrush
  include Chargeable
end

nexus6 = SmartPhone.new
toothbrush = ElectricToothbrush.new

# Both devices can charge, even though they have different superclasses:
nexus6.charge
toothbrush.charge

# nexus6
# method shared via class inheritance:
nexus6.call
# method shared via mixing in a module:
nexus6.pair

# Bluetooth comes before Chargeable, since Bluetooth was included last:
SmartPhone.ancestors