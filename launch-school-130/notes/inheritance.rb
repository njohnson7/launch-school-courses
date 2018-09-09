# INHERITANCE

=begin

- a relationship b/w two or more classes:
  - a single superclass:
    - large reusability
  - one or more subclasses:
    - specialized behavior
- each subclass gains access to:
  - instance/class methods
  - constants
  - class variables
- Single inheritance:
  - a subclass can only have one superclass
  - a superclass can have multiple subclasses
- polymorphic structure
- extract common behaviors to superclass
  - extract logic to one place for re-use -> DRY
- model hierarchical domains ('is-a')
----------------------
- DRY: every piece of knowledge should have a single, authoritative, unambiguous representation in a system
- messages are forwarded from subclass to superclass
  - automatic message delegation
    - if 1 obj can't respond to a received message, it is delegated to another obj
- #initialize is inherited from BasicObject
- Class#superclass

=end

class Phone
  # general behavior:
  def call
    'calling...'
  end
end

class PayPhone < Phone
  # specialized behavior:
  def insert_money
    'inserting money...'
  end
end

class SmartPhone < Phone
  # specialized constant:
  NUMBER_OF_BATTERIES = 1

  def self.validate_imei(number)
    "Validating IMEI number..."
  end

  def open_app
    'opening app...'
  end
end

class IPhone < SmartPhone
  # specialized constant:
  MANUFACTURER = 'Apple'

  def ask_siri(question)
    "Asking Siri: '#{question}'..."
  end
end

class Pixel < SmartPhone
  MANUFACTURER = 'Google'

  def ask_google_assistant(question)
    "Asking Google Assistant: '#{question}'..."
  end
end



pay_phone = PayPhone.new
pixel = Pixel.new
iphone = IPhone.new

# all of Phone's subclasses inherit #call:
pay_phone.call
iphone.call
pixel.call

# objects of different subclasses have specialized behavior:
pay_phone.insert_money
iphone.ask_siri('What is my schedule today?')
pixel.ask_google_assistant('What is my schedule today?')

# SmartPhone's class methods are inherited:
IPhone.validate_imei(12345)
Pixel.validate_imei(12345)
