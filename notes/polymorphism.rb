# POLYMORPHISM

=begin

Polymorphism:
  - 'many forms'
  - the ability for messages or methods with the same name to have different behavior
    - depends on what that object is called on
      - ex:
        - including modules to mix in methods
        - inheritance
        - method overriding
        - duck typing

----------------------
- Allows us to use prewritten code for new purposes

=end

# DUCK TYPING:
class SmartPhone
  def voice_call
    'Choose a contact or enter number...'
    'Calling number with SmartPhone...'
  end
end

class Skype
  def voice_call
    'Enter recipients username:...'
    'Calling username with Skype...'
  end
end

class PayPhone
  def voice_call
    'Insert money:...'
    'Enter number:...'
    'Calling number with PayPhone...'
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

