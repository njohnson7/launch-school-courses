# POLYMORPHISM

=begin

- ability for data to be represented as many different types
- use prewritten code for new purposes
- methods w/ same name => different behavior
  - different objects can respond to same message
    - single message has many forms
- ex:
  - modules
  - inheritance
  - method overriding
    - operator overloading
  - duck typing:
    - the type of an obj is the set of methods to which it can respond

=end

# different behavior for same message, depending on receiver:
class Phone
  def initialize
    @handsets = 1
  end

  def *(number)
    @handsets *= number
    self
  end
end

phone = Phone.new

5     * 5  # ==> 25
5.0   * 5  # ==> 25.0
'5'   * 5  # ==> "55555"
[5]   * 5  # ==> [5, 5, 5, 5, 5]
phone * 5  # ==> #<Phone:0x00000001271b08 @handsets=5>


# all 3 of these classes have a #voice_call instance method that has slightly different behavior:
class Phone
  def voice_call
    'Enter a number...'
    'Calling...'
  end
end

class SmartPhone < Phone
  def voice_call
    'Enter a number or choose a contact...'
    'Calling...'
  end
end

class PayPhone < Phone
  def voice_call
    'Insert money and enter a number...'
    'Calling...'
  end
end


# DUCK TYPING:
class SmartPhone
  def voice_call
    'Choose a contact or enter number...'
    'Calling with SmartPhone...'
  end
end

class Skype
  def voice_call
    'Enter recipients username:...'
    'Calling with Skype...'
  end
end

class PayPhone
  def voice_call
    'Insert money and enter number:...'
    'Calling with PayPhone...'
  end
end

smart_phone = SmartPhone.new
skype = Skype.new
pay_phone = PayPhone.new

# Even though these 3 objects are instances of different classes, they still respond to a message with the same name: #voice_call.
# although it has different behavior depending on which object it gets sent to:
smart_phone.voice_call  # ==> "Calling number with SmartPhone..."
skype.voice_call        # ==> "Calling username with Skype..."
pay_phone.voice_call    # ==> "Calling number with PayPhone..."

class Person
  attr_reader :calling_device

  def initialize(calling_device)
    @calling_device = calling_device
  end
end

calling_devices = [smart_phone, skype, pay_phone]
bob = Person.new(calling_devices.sample)
fred = Person.new(calling_devices.sample)

# we don't need to worry about which calling device a Person object has.
# b/c we know that all calling devices will respond to #voice_call:
bob.calling_device.voice_call   # ==> "Calling username with Skype..."
fred.calling_device.voice_call  # ==> "Calling number with PayPhone..."





