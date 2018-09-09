# easy2_04.rb

# What could you add to this class to simplify it and remove two methods from
# the class definition while still maintaining the same functionality?

# class BeesWax
#   def initialize(type)
#     @type = type
#   end

#   def type
#     @type
#   end

#   def type=(t)
#     @type = t
#   end

#   def describe_type
#     puts "I am a #{@type} of Bees Wax"
#   end
# end

class BeesWax
  attr_accessor :type, :fish

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

wax = BeesWax.new('yo')
wax.describe_type
p wax.type = 'aa'
p wax.type
wax.describe_type
p wax.instance_variables
p wax.instance_variable_defined?(:@fish)
p BeesWax.instance_methods

# You can call the Module#attr_accessor method at the beginning of the class
#  definition, passing it the the name of the instance variable @type in symbol
#  form, like :type, which will define a named attribute for the BeesWax class
#  called @type, and also automatically creates both a getter and a setter
#  method for @type, so we can remove the explicit getter and setter methods
#  from the class definition and still retain the same functionality.
