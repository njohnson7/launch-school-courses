# ABSTRACTION

=begin

- simplifying complex reality by modeling classes appropriate to the problem
  - reduce real objects down to only essential characteristics/behavior
- OOP => new level of abstraction
  - by creating objects thru encapsulation
  - objects => nouns, methods => behavior

=end

# SmartPhone is an abstract class:
  # a generic class that doesn't reperesent a whole object by itself.
# SmartPhones don't exist as a generic entity:
  # they have to be of a certain type.
class SmartPhone
  # abstract logic of opening an app by encapsulating into a method:
  def open_app
    'opening app...'
  end
end

class AndroidPhone < SmartPhone
  def google_now
    'google now...'
  end
end

class iPhone < SmartPhone
  def siri
    'siri...'
  end
end
