# METHOD OVERRIDING

=begin

- defining a method in a class that has the same name as a method further up in method lookup path
  - gets priority in being invoked
- polymorphism
- ACCIDENTAL METHOD OVERRIDING:
  - overriding Object instance method can have far-reaching effects
  - some won't have any major side-effects, like #to_s
- fake operators, '==', '!='
-------------------
- Comparable, '<=>'

=end


# user-defined-method overriding:
class SmartPhone
  def charge
    'charging...'
  end
end

class Nexus6
  def charge
    'charging faster with QuickCharge technology...'
  end
end

smart_phone = SmartPhone.new
nexus6 = Nexus6.new

smart_phone.charge  # ==> "charging..."
nexus6.charge       # ==> "charging faster with QuickCharge technology..."




# operator overriding:
class SmartPhone
  def initialize(model)
    @model = model
  end
end

my_nexus6 = SmartPhone.new('Nexus 6')
your_nexus6 = SmartPhone.new('Nexus 6')
# Object#== returns true if two objects are the same object:
my_nexus6 == your_nexus6                 # ==> false

class SmartPhone
  attr_reader :model

  # override #== so now it will return true if 2 phones are the same model:
  def ==(other)
    model == other.model
  end
end

my_nexus6 = SmartPhone.new('Nexus 6')
your_nexus6 = SmartPhone.new('Nexus 6')
my_nexus6 == your_nexus6                 # ==> true



# ACCIDENTAL METHOD OVERRIDING:

# using Object#object_id for checking if 2 objects are the same object.
class SmartPhone
  def initialize(imei_number)
    @imei_number = imei_number
  end
end

# normal behavior:
smart_phone = SmartPhone.new(12345)
another_smart_phone = SmartPhone.new(12345)
smart_phone.object_id                                   # ==> 20502220
# not the same object:
smart_phone.object_id == another_smart_phone.object_id  # ==> false

class SmartPhone
  def object_id
    @imei_number
  end
end

# accidental overridden behavior:
smart_phone.object_id                                   # ==> 12345
# still not the same object, but now it appears like they are:
smart_phone.object_id == another_smart_phone.object_id  # ==> true




# ACCIDENTAL:
module CyanogenMod; end

class AndroidPhone; end

android_phone = AndroidPhone.new
android_phone.extend(CyanogenMod)  # ==> #<AndroidPhone:0x0000000095e660>

class AndroidPhone
  def extend
    'Extending battery life...'
  end
end

android_phone = AndroidPhone.new
android_phone.extend(CyanogenMod)
# ~~> ArgumentError: wrong number of arguments (given 1, expected 0)
