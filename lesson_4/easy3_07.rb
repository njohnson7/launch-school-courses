# easy3_07.rb

# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end


# self.information is a class method defined in the Light class that doesn't
#  add or change any value, it only returns a static string. The getter
#  instance methods brightness and color, created by attr_accessor, both don't
#  add or change any value either, they only return the objects contained in
#  @brightness and @color when called.

# The return keyword in self.information also does not add any value, as it can
#  be omitted and the following string would still be returned by the method.
