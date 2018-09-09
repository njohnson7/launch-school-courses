# CLASS VARIABLES

=begin

- 2 @ characters
- info related to an entire class (and descendents)
  - does not pertain to individual objects
- scoped at class level:
  - access from w/i class def or instance/class methods
- all objects share 1 copy of a class var
- only var that can share state b/w objects
- subclasses can override a class variable
  - so don't use class vars!
-----------------------
- referencing an undefined class var raises a NameError

=end

class Phone
  # Class variable that keeps track of the total number of objects instantiated from class Phone or any of its descendants:
  @@total_number_of_phones = 0

  # class method that returns a class variable.
  def self.total_number_of_phones
    @@total_number_of_phones
  end

  def initialize(model)
    @model = model
    @@total_number_of_phones += 1
  end

  # we can also access a class variable w/i an instance method:
  def total_number_of_phones
    @@total_number_of_phones
  end
end

class SmartPhone < Phone
end

Phone.total_number_of_phones  # ==> 0

# Every time a phone is created, @@total_number_of_phones is incremented by 1:
phone = Phone.new('ABC123')
Phone.total_number_of_phones  # ==> 1

# We have 2 methods we can call to access @@total_number_of_phones.
# Both Phone and SmartPhone objects have these 2 methods.
  # Class variables and class methods are inherited.
  # all objects share 1 copy of this class var
smart_phone = SmartPhone.new('Nexus 6')
SmartPhone.total_number_of_phones        # ==> 2
smart_phone.total_number_of_phones       # ==> 2
Phone.total_number_of_phones             # ==> 2
phone.total_number_of_phones             # ==> 2


5.times { Phone.new('generic') }
Phone.total_number_of_phones      # ==> 7



# even subclasses of a subclass of Phone share class vars:
class IPhone < SmartPhone; end

iphone7 = IPhone.new('iPhone 7')
IPhone.total_number_of_phones     # ==> 8



# PayPhone overrides @@total_number_of_phones in its superclass, other subclasses on same level, and even subclasses of other subclasses:
class PayPhone < Phone
  @@total_number_of_phones = 99
end

PayPhone.total_number_of_phones    # ==> 99
Phone.total_number_of_phones       # ==> 99
SmartPhone.total_number_of_phones  # ==> 99
IPhone.total_number_of_phones      # ==> 99