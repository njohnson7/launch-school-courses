# SELF

=begin

- self keyword == a reference to the current object
- used to specify a certain scope for our program
  - it is a way to be explicit about:
    - what our program is referencing
    - what our intentions are in regards to behavior
- what it refers to depends on where it is used (the scope it is defined in)
  - w/i an instance method definition:
    - references the receiver
  - w/i a class def, but outside of an instance method:
    - references the class
- 2 main use cases:
  - 1) when calling setter methods from w/i a class:
    - to disambiguate syntax from initializing a local var
  - 2) class method definitions:
    - defines the method on the class

=end

class SmartPhone
  # inside of a class definition, and outside of an instance method, self refers to the class:
  p self          # ==> SmartPhone

  def self.what_is_self_class_method_1
    self
  end

  # this is equivalent to the above, b/c self references SmartPhone:
  def SmartPhone.what_is_self_class_method_2
    self
  end

  attr_accessor :color

  def what_is_self_instance_method
    self
  end

  def change_color(color)
    # from within an instance method definition, setter methods must always be called with an explicit receiver by prepending self.
    self.color = color

    # public and protected methods can optionally be called with self.
    # b/c self is the implicit receiver of any method called without an explicit receiver.
    what_is_self_instance_method
    self.what_is_self_instance_method

    # private methods that aren't setter methods can never be called w/ self.
  end

end

# inside of a class method, self refers to the class:
SmartPhone.what_is_self_class_method_1       # ==> SmartPhone
SmartPhone.what_is_self_class_method_2       # ==> SmartPhone

# inside of an instance method, self refers to the instance of the class:
nexus6 = SmartPhone.new              # ==> #<SmartPhone:0x00000001136e00>
nexus6.what_is_self_instance_method  # ==> #<SmartPhone:0x00000001136e00>

nexus6.change_color('blue')

# equivalent to calling self.color from within an instance method definition:
nexus6.color                 # ==> "blue"
