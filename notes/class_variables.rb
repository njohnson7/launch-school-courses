# CLASS VARIABLES

=begin

- created using 2 @ characters
- variable for capturing info related to an entire class (plus all descendents)
  - does not pertain to individual objects
- can be accessed from w/i instance methods or class methods

=end

# ex - @@number_of_dogs, Dog.total_number_of_dogs
# this is an example of using a class var and a class method to keep track of a class level detail that only pertains to the class, and not to individual objects.


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
smart_phone = SmartPhone.new('Nexus 6')
SmartPhone.total_number_of_phones        # ==> 2
smart_phone.total_number_of_phones       # ==> 2
Phone.total_number_of_phones             # ==> 2
phone.total_number_of_phones             # ==> 2


5.times { Phone.new('generic') }
Phone.total_number_of_phones      # ==> 7
