# STATES VS. BEHAVIOR

=begin

- states track attributes for individual objects: ivars
  - unique to every object (even instances of the same class)
    - (which ones / how many are defined, and values)
  - scoped at the object (instance) level
    - so they can be accessed from any instance method
    - exist for as long as the object instance exists
    - must be initialized w/i instance methods
  - ivars are 1 way of tying data to objects
  - syntax:  @ character, snake_case
- behaviors => what objects are capable of doing: methods
  - shared b/w all objects/instances of the same class
  - methods of an object are the instance methods defined in its class
**- instance methods expose behavior for objects
----------------
- object/instance = collection of ivars and a reference to a class:
  - an object's ivars live in the object itself
  - an object's methods live in the object's class (instance methods of class)
- all ivars belong to the current object self

=end

class SmartPhone
  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  # we can expose information about the state of an object using instance methods:
  def open_app(app_name)
    "#{app_name} has been opened on your #{@model}."
  end

  def add_contact(name)
    @contacts ||= []
    @contacts << name
  end
end

nexus6 = SmartPhone.new('Motorola', 'Nexus 6')
pixel = SmartPhone.new('Google', 'Pixel')

# all objects of the same class share the same behaviors, although they contain different states.
# they both open an app in the same way, but they have their own unique @model:
nexus6.open_app('SoundCloud')  # ==> "SoundCloud has been opened on your Nexus 6."
pixel.open_app('SoundCloud')   # ==> "SoundCloud has been opened on your Pixel."



# the values of instance variables are unique to each object:
nexus6
# ==> #<SmartPhone:0x0000000234b208 @brand="Motorola", @model="Nexus 6">
pixel
# ==> #<SmartPhone:0x0000000222a6f8 @brand="Google", @model="Pixel">

# ivars are not initialized until the instance method in which they are defined in is invoked:
pixel.add_contact('Fred')
# so ivars can also be unique in regards to how many and which ones are defined:
pixel   # ==> #<SmartPhone:0x0000000234a9c0
        #     @brand="Samsung", @model="Galaxy S8",  @contacts=["Fred"]>




# undefined ivars return nil:
class Phone
  def model
    @model
  end
end

phone = Phone.new
phone.model        # ==> nil



class Phone
  def initialize(model)
    @model = model
  end
end

class PayPhone < Phone; end

# Phone's constructor method defines an @model ivar for the pay_phone object:
pay_phone = PayPhone.new('XYZ123')  # ==> #<PayPhone:0x00000001c8a428 @model="XYZ123">



# ivars can be initialized w/i instance methods mixed in from a Module:
module Bluetooth
  attr_reader :bluetooth

  def enable_bluetooth
    @bluetooth = true
  end
end

class SmartPhone
  include Bluetooth
end

nexus6 = SmartPhone.new('Motorola', 'Nexus 6')
nexus6.bluetooth              # ==> nil
nexus6.enable_bluetooth
nexus6.bluetooth              # ==> true