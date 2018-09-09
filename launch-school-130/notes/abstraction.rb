# ABSTRACTION

=begin

- simplifying complex reality by modeling classes appropriate to the problem
  - reduce real objects down to only essential characteristics/behavior
- OOP => new level of abstraction
  - by creating objects thru encapsulation
  - objects => nouns, methods => verbs

=end

# Phone is an abstract class:
  # a generic class that doesn't reperesent a whole object by itself.
# Phones don't exist as a generic entity,
  # they have to be of a certain type.
class Phone
  def voice_call; end
end

class SmartPhone < Phone
  def open_app; end
end

class PayPhone < Phone
  def insert_money; end
end


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


