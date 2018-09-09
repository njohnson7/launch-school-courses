# easy3_05.rb

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # => undefined method error
tv.model # => # method logic

Television.manufacturer # => # method logic
Television.model # => undefined method error

# tv.manufacturer would raise a NoMethodError because  manufacturer is defined
# a class method, due to the presence of the self keyword, so it can only be
# called on the Television class itself, not an instance of the class.

# Television.model would raise a NoMethodError because model is defined as an
#  instance method, so it can only be called on an instance of the Television
#  class, not the class itself.
