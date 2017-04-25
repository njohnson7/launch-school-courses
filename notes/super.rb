# SUPER

=begin

- keyword that searches the inheritance hierarchy for a method w/ the same name as the method it is called from, and invokes it
- can be used w/i an overriden method to extend the functionality of an inherited method
- most commonly used with #initialize
  - ex: for setting additional ivars
- arguments:
  - when called w/ no arguments:
    - automatically forwards the arguments that were passed to the method from which it is called
  - when called w/ specific arguments:
    - the specified args will be sent up the method lookup chain
  - when called w/ empty ()'s
    - calls superclass method w/o any args

=end

# Phone class with a #voice_call instance method:
class Phone
  def voice_call(number = nil)
    'Enter a number:...' unless number
    number ||= '<entered number>'
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

phone = Phone.new
nexus6 = SmartPhone.new

phone.voice_call   # ==> "Calling <entered number>..."
nexus6.voice_call  # ==> "Calling <number OR get number from chosen contact>..."



# super in initialize:
class Phone
  def initialize(model)
    @model = model
  end
end

class SmartPhone < Phone
  def initialize(model, screen_size)
    # super w/ arg passes (forwards) just the specified arg to superclass method:
    super(model)
    @screen_size = screen_size
  end
end

phone = Phone.new('XYZ123')
# ==> #<Phone:0x00000001d1a7d0 @model="XYZ123">
nexus6 = SmartPhone.new('Nexus 6', '6 inches')
# ==> #<SmartPhone:0x00000001d1a3c0 @model="Nexus 6", @screen_size="6 inches">




class IPhone < SmartPhone
  def initialize(model, screen_size)
    # super w/ no arg forwards all args passed in to superclass:
    super
    @manufacturer = 'Apple'
  end
end

iphone = IPhone.new('iPhone 7', '5.5 inches')
# ==> ... @model="iPhone 7", @screen_size="5.5 inches", @manufacturer="Apple">



# NO ARGUMENTS:
class SmartPhone
  def initialize
    @contacts = []
  end
end

class IPhone < SmartPhone
  def initialize(color)
    # super w/ parentheses calls superclass method w/o passing any arguments:
    super()
    @color = color
  end
end

iphone = IPhone.new('white')
# ==> #<IPhone:0x00000000b64950 @contacts=[], @color="white">




# also works w/ modules:
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