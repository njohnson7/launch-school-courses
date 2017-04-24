# CONSTANTS

=begin

- use when you want to store a value that will never change for any reason
- must begin w/ capital letter
  - conventionally in all caps
- constants can be reassigned but Ruby will throw a warning

=end



class IPhone
  MANUFACTURER = 'Apple'.freeze

  def self.display_manufacturer
    puts "#{self} manufacturer: #{MANUFACTURER}"
  end
end

IPhone.display_manufacturer
# <= IPhone manufacturer: Apple



# Constants can be accessed through inheritance:
class IPhone7 < IPhone
  def signature_msg
    "Sent from my #{MANUFACTURER} #{self.class}."
  end
end

my_iphone7 = IPhone7.new
my_iphone7.signature_msg  # ==> "Sent from my Apple IPhone7."




module Chargeable
  def charger_type
    "You need a charger made by #{IPhone::MANUFACTURER}"
  end
end

class IPhone
  include Chargeable

  MANUFACTURER = 'Apple'.freeze

  def manufacturer
    MANUFACTURER
  end
end

class IPhone7 < IPhone
  def to_s
    "Phone type: #{self.class}. Manufacturer: #{MANUFACTURER}"
  end
end

