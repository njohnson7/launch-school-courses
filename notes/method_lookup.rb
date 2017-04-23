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