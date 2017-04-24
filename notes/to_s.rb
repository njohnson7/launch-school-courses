# TO_S

=begin

- all classes inherit #to_s from Object
- to_s is automatically called on (used implicitly):
  - expressions interpolated into strings
  - arguments passed in to puts
- by default, Object#to_s returns a string containing the object's class and an encoding of the object id
  - we can override this by defining a custom to_s method in a class
    - so it returns a more human-readable (user-friendly) string
- p calls inspect on its argument(s) instead of to_s
  - useful for debugging, so don't override
  - returns its arguments instead of nil

=end

class SmartPhone
  def initialize(brand, model)
    @brand = brand              # => "Motorola"
    @model = model              # => "Nexus 6"
  end                           # => :initialize
end                             # => :initialize

nexus6 = SmartPhone.new('Motorola', 'Nexus 6')  # => #<SmartPhone:0x000000008c1298 @brand="Motorola", @model="Nexus 6">

# implicitly calls Object#to_s by default:
puts nexus6  # <= #<SmartPhone:0x00000000de6f70>


class SmartPhone
  # override #to_s:
  def to_s
    "#{@brand} #{@model} #{self.class}"  # => "Motorola Nexus 6 SmartPhone", "Motorola Nexus 6 SmartPhone", "Motorola Nexus 6 SmartPhone"
  end                                    # => :to_s
end                                      # => :to_s

# implicitly calling #to_s:
puts nexus6                # <=  Motorola Nexus 6 SmartPhone
p "Phone info: #{nexus6}"  # ==> "Phone info: Motorola Nexus 6 SmartPhone"

# explicitly calling #to_s:
p nexus6.to_s        # <= "Motorola Nexus 6 SmartPhone"

# Kernel::p calls Object#inspect:
p nexus6             # => #<SmartPhone:0x000000008c1298 @brand="Motorola", @model="Nexus 6">
# <= #<SmartPhone:0x00000000de6f70 @brand="Motorola", @model="Nexus 6">
puts nexus6.inspect  # => nil
# <= #<SmartPhone:0x00000000de6f70 @brand="Motorola", @model="Nexus 6">



p "Hi #{3 + 4}"                  # => "Hi 7"
p "Hi #{[1, 2, 3].map(&:abs2)}"  # => "Hi [1, 4, 9]"

# >> #<SmartPhone:0x000000008c1298>
# >> Motorola Nexus 6 SmartPhone
# >> "Phone info: Motorola Nexus 6 SmartPhone"
# >> "Motorola Nexus 6 SmartPhone"
# >> #<SmartPhone:0x000000008c1298 @brand="Motorola", @model="Nexus 6">
# >> #<SmartPhone:0x000000008c1298 @brand="Motorola", @model="Nexus 6">
# >> "Hi 7"
# >> "Hi [1, 4, 9]"