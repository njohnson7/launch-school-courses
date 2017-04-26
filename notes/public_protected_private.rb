# PUBLIC PRIVATE PROTECTED METHODS

=begin

- public methods (public interface):
  - available to anyone who knows class name or object's name
    - readily available for the rest of the program to use
  - comprise the class's interface:
    - how other classes and objects will interact w/ this obj and class
    - interace should only change when necessary
- private methods:
  - do work in the class, but don't need to be available to rest of program
    - use when implementation is likely to change (unstable)
  - encapsulation: data protection
  - any methods defined following Module#private will be private
  - accessible from inside class def when called w/o self
    - except for private setter methods!
- protected methods:
  - from outside a class def, act just like private methods
  - from inside a class def, accessible just like public methods
  - for comparing attributes that we don't want to expose a public interface to
- inherited methods maintain their public/protected/private status (visibility)
- exposing a public interface by defining a public method that calls a private method:
  - do some conditional check or verification:
    - to see if the method caller should be able to call the private method.
- intention!
  - easy to bypass
  - guideline for clients of a class
-------------------
- access modifiers
- levels of visibility
=end


# PRIVATE:
class SmartPhone
  def initialize(pin_number)
    @pin_number = pin_number
  end

  # expose a public interface that allows us to do a conditional check instead of allowing user to access the setter method directly:
  def change_pin_number(current_number, new_number)
    # @pin_number is protected against modification by an unauthorized user:
    raise 'Current pin invalid.' unless valid_pin_number?(current_number)
    # private methods cannot be called with an explict receiver, except for setter methods, which require one:
    self.pin_number = new_number
  end

  # every method below Module#private is defined as private:
  private

  # use private method to hide implementation details that might change, and that the user does not need to be aware of:
  def valid_pin_number?(number)
    # private methods cannot be called with an explict receiver:
    self.pin_number == number rescue $!
    # ==> #<NoMethodError: private method `pin_number' called...
    pin_number == number
  end

  attr_accessor :pin_number
end

nexus6 = SmartPhone.new('1234')

# private methods cannot be called from outside a class definition:
nexus6.pin_number rescue $!
# ==> NoMethodError: private method `pin_number' called...
# nexus6.pin_number = '1111'
# ==> NoMethodError: private method `pin_number=' called...


nexus6.change_pin_number('2222', '1111') rescue $!
# ==> #<RuntimeError: Invalid Pin Number>
nexus6.change_pin_number('1234', '1111')




# PROTECTED:   ----------MAYBE CHANGE???----------------

class SmartPhone
  # mix in the Comparable module to get access to instance methods for comparing objects:
  include Comparable

  def initialize(price)
    @price = price
  end

  # define a shovel (fake) operator method to tell Ruby how we want to compare SmartPhones (which ivar we want to look at):
  def <=>(other)
    # like public methods, protected methods can be called with or without an explicit receiver:
    self.price <=> other.price
    price <=> other.price
  end

  protected

  attr_reader :price
end

nexus6 = SmartPhone.new(200)
pixel = SmartPhone.new(700)
iphone7 = SmartPhone.new(700)

# like private methods, protected methods cannot be called from outside a class definition:
nexus6.price rescue $!  # ==> #<NoMethodError: protected method `price' called...

# By defining #price as protected, we can compare SmartPhone objects without exposing a public interface for retrieving the value of @price.
# We are now able to call any Comparable instance method on SmartPhone objects.
nexus6 > pixel    # ==> false
pixel > nexus6    # ==> true

pixel < iphone7   # ==> false
pixel == iphone7  # ==> true
pixel != iphone7  # ==> false

[nexus6, pixel, iphone7].sort
# ==> [#<SmartPhone:0x00000001f49538 @price=200>,
       #<SmartPhone:0x00000001f49128 @price=700>,
       #<SmartPhone:0x00000001f48cf0 @price=700>]



# public, private, and protected methods keep the same level of visibility when inherited:
class Nexus6 < SmartPhone; end

nexus6.price rescue $! # ==> #<NoMethodError: protected method `price' called...