# ACCESSOR METHODS

=begin

- getter methods:
   - expose an object's state
- setter methods:
  - expose a method that allows us to change an object's state (ivar)
  - syntactical sugar
- naming convention: same name as ivar
- Module#attr_*s :
  - automatically defines getter/setter methods
  - can be dangerous to use public attr_*s b/c clients of class can directly access
- generally better to call getter/setter instead of direct reference
    - when we don't want to expose raw data
      - pre-processing
- setters => explicit receiver
  - (not optional like other instance methods)

--WHY?
  - getter/setter methods:
    - ivars are not accessible by default
      - getter/setter lets us read/write to them
  - attr_* methods:
    - getter/setter methods are very commonly used
      - manually defining => tedious, adds repetitive lines of code (!DRY)
        - more likely to have bugs caused by typos, etc
  - just make change in one place:
    - when there's a bug or we change implementation
--------------
- class macros

=end

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

  #  #color can be called with or without an explicit receiver:
  def display_color
    puts "This phone's color is #{color}"
    puts "This phone's color is #{self.color}"
    # or we can directly reference @color:
    puts "This phone's color is #{@color}"
  end
end

phone.display_color




# SETTER METHODS MUST BE CALLED W/ SELF:
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
