# TO_S

=begin

- all classes inherit #to_s from Object
- #to_s is automatically called on (used implicitly):
  - string interpolation
  - puts
- Object#to_s => returns string containing object's class and an encoding of object id
  - override by defining a custom #to_s method in a class
    - so it returns a more human-readable (user-friendly) string
  - safe to override w/o side effects
- Kernel::p calls #inspect on its argument(s) instead of #to_s
  - useful for debugging, so don't override
  - returns arguments instead of nil
----------------
- must return a String object!
=end

class SmartPhone
  def initialize(brand, model)
    @brand = brand
    @model = model
  end
end

nexus6 = SmartPhone.new('Motorola', 'Nexus 6')

# implicitly calls Object#to_s by default:
puts nexus6  # <= #<SmartPhone:0x00000000de6f70>


class SmartPhone
  # override #to_s:
  def to_s
    "#{@brand} #{@model} #{self.class}"
  end
end

# implicitly calling #to_s:
puts nexus6                # <=  Motorola Nexus 6 SmartPhone
p "Phone info: #{nexus6}"  # ==> "Phone info: Motorola Nexus 6 SmartPhone"

# explicitly calling #to_s:
p nexus6.to_s        # <= "Motorola Nexus 6 SmartPhone"

# Kernel::p calls Object#inspect:
p nexus6
# <= #<SmartPhone:0x00000000de6f70 @brand="Motorola", @model="Nexus 6">
puts nexus6.inspect
# <= #<SmartPhone:0x00000000de6f70 @brand="Motorola", @model="Nexus 6">
