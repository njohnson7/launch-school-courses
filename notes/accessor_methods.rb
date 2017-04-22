# ACCESSOR METHODS

=begin

  - getter methods:
     - expose an object's state (ivar)
     - return the value referenced by an ivar
  - setter methods:
    - expose a method that allows us to change an object's state (ivar)
    - initializes or reassigns an ivar to value passed in as an argument
    - syntactical sugar:
      - Ruby recognizes setter methods and allows us to use more natural assignment syntax
  - naming convention: use the same name as ivar
  - Module#attr_accessor :
    - automatically defines getter/setter methods
    - b/c these methods are so commonly used
    - takes 1+ symbols as argument(s) which it uses to create the method names
  - attr_reader, attr_writer
  - can be invoked in a class def instead of directly referencing an ivar
    - it's generally better to call a getter/setter method instead of direct reference
      - ie, in situations where we don't want to expose raw data
      - pre-processing
  - setter methods must be called w/ an explicit receiver
    - any instance method can be called w/i a class def by prefixing self (except private!)

- WHY EXIST:
  - getter/setter methods:
    - ivars are not accessible by default
      - getter/setter lets us read/write to them
  - attr_* methods:
    - getter/setter methods are very commonly used
      - defining them manually is tedious
        - adds repetitive lines of code
          - not DRY
          - more likely to have bugs caused by typos
    -

=end

# manual getter and setters (downsides - take up a lot of room for a simple feature)
  # syntactical sugar
# attr_*s
# calling outside of a class def
# calling within a class def
# ex: @ssn, masking all digits except last 4
  # reference a getter method, so we can just make the change in one place if there's a bug or we need to modify the format

# local var assignment vs setter method call


# no getter and setter:
class Phone
  def initialize(color)
    @color = color
  end
end

phone = Phone.new('black')

# no way of accessing the @color ivar:
# phone.color           # ==> NoMethodError
# phone.color = 'blue'  # ==> NoMethodError



# manual getter to expose phone's @color attribute:
class Phone
  # same method name as ivar:
  def color
    @color
  end
end

phone.color

# EQUIVALENT:
# attr_reader defines a getter method:
class Phone
  attr_reader :color
end

phone.color



# manual setter:
class Phone
  # same method name as ivar, followed by '=' :
  def color=(m)
    @color = m
  end
end

phone.color = 'blue'
phone.color

# EQUIVALENT:
# attr_writer defines a setter method:
class Phone
  attr_writer :color
end

phone.color = 'red'
phone.color



# attr_accessor defines BOTH a getter and setter:
class Phone
  attr_accessor :color
end

phone.color = 'silver'
phone.color

# syntactical sugar:
phone.color = 'black'
phone.color=('black')
# these 2 expressions are equivalent, both are method calls
# '=' is actually part of the name of a setter method, not an assignment operator.



# getter methods can also be called from w/i other instance methods:
class Phone
  attr_accessor :color

  #  #color can be called with or without an explict receiver:
  def display_color
    puts "This phone's color is #{color}"
    puts "This phone's color is #{self.color}"
  end
end

phone.display_color




class Phone
  attr_accessor :color

  # exposing an interface to change @color:
  def repaint(new_color)
    color = new_color

    # @color is not modified:
    self.color
    @color

    # __WHY?__
    # color =   is local variable assignment, not a call to a setter method:
    defined? color   # ==> 'local-variable'

    # must call setter method w/ an explicit receiver (self):
    self.color = new_color

    # @color sucessfully modified:
    self.color              # ==> "red"
  end
end

phone.color = 'black'
phone.repaint('red')
phone.color



# use custom getter/setter instead of attr_accessor for pre-processing:
class Phone
  # argument validity check:
  def number=(num)
    raise 'Invalid Number' unless num.is_a?(Integer)
    @number = num
  end

  # special formatting:
  # encapsulate the logic for formatting number in getter method
  def number
    @number.to_s.gsub(/\A.*\z/, '(123) 456 - 7890')
  end
end

phone.number = 1234567890
phone.number



# use getter method instead of referencing @number directly
  # so we don't have to format @number manually every time.
# if we modify how a number should be formatted
  # we can just make the change in one place.
class Phone
  def display_number
    puts "This phone's number is: #{number}"
    puts "This phone's number is: #{@number.to_s.gsub('...', '...')}"
  end

  def contact_info_msg
    "Please dial #{number} to call this phone."
    "Please dial #{@number.to_s.gsub('...', '...')} to call this phone."
  end
end



# we can pass in multiple arguments, as symbols or strings to #attr_accessor:
class SmartPhone
  attr_accessor :color, :number, 'model'
end

smart_phone = SmartPhone.new
smart_phone.color = 'blue'
smart_phone.model = 'Nexus 6'
smart_phone.color              # ==> "blue"
smart_phone.model              # ==> "Nexus 6"

# ivars are not defined until the method in which they are initialized is called.
# return nil instead of NameError like local variables
smart_phone.number             # ==> nil
