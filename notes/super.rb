# SUPER

=begin

- a keyword that searches the inheritance hierarchy for a method w/ the same name as the method it is called from, and invokes it
- can be used w/i an overriden method to extend the functionality of an inherited method
- most commonly used with #initialize
  - ex: for setting additional ivars
- arguments:
  - when called w/ no arguments:
    - automatically forwards the arguments that were passed to the method from which it is called
  - when called w/ specific arguments:
    - the specified args will be sent up the method lookup chain

=end

# Phone class with a #voice_call instance method:
class Phone
  def voice_call(number)
    "Calling #{number}..."
  end
end

# SmartPhone class that subclasses Phone, and inherits #voice_call instance method:
class SmartPhone < Phone
  # extend the functionality of Phone#voice_call by overriding it, and then using the super keyword to invoke it:
  def voice_call
    # additional functionality:
    "Enter a number or choose contact:..."
    number = '<number OR get number from chosen contact>'
    super(number)
  end
end

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak

# In the above example, we've created a simple Animal class with a speak instance method. We then created GoodDog which subclasses Animal also with a speak instance method to override the inherited version. However, in the subclass' speak method we use super to invoke the speak method from the superclass, Animal, and then
# ***we extend the functionality*** by appending some text to the result.

# no args
# specific args

#--------------
module M
  def my_method
    'module method'
  end
end

class C
  include M

  def my_method
    super + ' class method'
  end
end

C.new.my_method  # ==> "module method class method"