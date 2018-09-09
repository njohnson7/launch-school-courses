# MODULES

=begin
- CLASSES VS. MODULES
  - both contain shared behavior and constants
  - modules:
    - 'has-a' relationships
    - cannot be used to instantiate objects
    - cannot be inherited
    - 'multiple inheritance'
      - no limit on how many can be mixed in
  - classes:
    - hierarchical ('is-a') relationships
    - single inhertiance:
      - hard to accurately model some problem domains
- MODULES:
  - CONTAINERS for grouping related methods/constants
  - 3 uses:
    - 1) mixins: collection of behaviors useable in other classes
      - group reusable code (common methods) into 1 place
    - 2) namespacing: container of constants:
      - organizing similar classes/constants under a module
      - 2 advantages:
        - makes it easier to recognize related classes in our code
        - less chance of classes colliding w/ similarly named classes
      - reference by: Module::Class
      - multiple constants can have same name in different namespaces
    - 3) a container for out of place methods (module methods)
  - polymorphic structure
  - using modules to group common behaviors allows us to build a more powerful, flexible, and DRY design
**- '-able' suffix
- method lookup path
---------------
- Class subclasses from Module
  - Class is Module w/ 3 extra public instance methods:
    - #new, #allocate, #superclass
- Module#append_features
- Module methods are not mixed in, like Class methods

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



