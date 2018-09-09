# CONSTANTS

=begin

- 'constant variables'
  - store a value that will never change for any reason
- capital letter (CamelCase or ALL_CAPS)
- reassigned => warning
- lexical scope: where used in code
  - not evaluated at runtime, unlike ivars or instance methods
  - access via path (::) or inheritance
-----------------
- can be accessed anywhere after they are defined
- constant lookup:
  - Module.nesting, Module.nesting.first.ancestors || Object.ancestors
- arranged in a tree like a file system:
  - modules/classes => directories
  - regular constants => files
- uniquely identified by path
- multiple constants can have same name if in different modules/classes
- ::CONSTANT => absolute path - root level constant
- Module.constants, Module#constants
- cannot be defined in a method

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

iphone7 = IPhone7.new
iphone7.signature_msg  # ==> "Sent from my Apple IPhone7."



# LEXICAL SCOPE!:
module Chargeable
  def charger_type
    "You need a charger made by #{IPhone::MANUFACTURER}"
    # this also works, b/c constants are inherited:
    "You need a charger made by #{IPhone7::MANUFACTURER}"

    # this does not work:
    "You need a charger made by #{MANUFACTURER}" rescue $!
    # ==> #<NameError: uninitialized constant Chargeable::MANUFACTURER>
  end
end

class IPhone
  include Chargeable

  MANUFACTURER = 'Apple'
end

class IPhone7 < IPhone
  def to_s
    "Phone type: #{self.class}. Manufacturer: #{MANUFACTURER}"
  end
end

iphone7.charger_type  # ==> "You need a charger made by Apple"