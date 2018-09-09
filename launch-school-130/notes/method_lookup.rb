# METHOD LOOKUP

=begin

- method lookup path:
  - ordered list of classes/modules:
    - Ruby traverses to find and invoke a method when method is called.
- Module#ancestors
- included modules inserted above the including class in the chain.
  - reverse order of inclusion.
- superclass's modules too
- every path ends in Object, Kernel, BasicObject
 - b/c every class inherently inherits from Object
---------------
- a module can appear only once in the same chain of ancestors
  - if you include module is already in the chain, 2nd+ inclusion is ignored
- every class except BasicObject has exactly one immediate ancestor:
  - a superclass or a module
    - so there's a single chain of ancestors from any class up to BasicObject
- when you call a method, Ruby goes 'right' in the receiver's 'real class', and then 'up' the ancestors chain

=end

module Callable
  def voice_call
    'Making a voice call...'
  end
end

module Chargeable
  def charge
    'charging...'
  end
end

module Bluetooth
  def pair
    'Bluetooth pairing...'
  end
end

class Phone
  include Callable
end

class SmartPhone < Phone
  # reverse order of inclusion:
  include Chargeable # second
  include Bluetooth  # first
end

class Nexus6 < SmartPhone
  def charge
    'charging faster with QuickCharge technology...'
  end
end

smart_phone = SmartPhone.new
nexus6 = Nexus6.new

# Ruby finds #charge in Chargeable:
smart_phone.charge  # ==> "charging..."

# Ruby finds #charge in Nexus6, then stops looking and invokes it:
nexus6.charge       # ==> "charging faster with QuickCharge technology..."

SmartPhone.ancestors
# ==> [SmartPhone, Bluetooth, Chargeable, Phone, Callable, Object, Kernel, BasicObject]
Nexus6.ancestors
# ==> [Nexus6, SmartPhone, Bluetooth, Chargeable, Phone, Callable, Object, Kernel, BasicObject]

# ---GoodDog method lookup---
# GoodDog
# Climbable
# Swimmable
# Animal
# Walkable
# Object
# Kernel
# BasicObject