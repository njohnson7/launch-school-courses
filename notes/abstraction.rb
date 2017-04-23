# ABSTRACTION

=begin

Abstraction:
  - definition:
    - creating classes that represent an object in a simplified way, reducing the object down to only its essentail characteristics and behavior relevant to the problem at hand.

---------------------
- OOP allows programmers to think on a new level of abstraction.
  - Objects are represented as real-world nouns, w/ methods that correspond to their behavior

=end

# SmartPhone is an abstract class - a generic class that doesn't reperesent a whole object by itself. SmartPhones don't exist as a generic entity, they have to be of a certain type.
class SmartPhone
  # extract the logic of opening an app into a method:
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