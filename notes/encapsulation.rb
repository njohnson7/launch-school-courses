# ENCAPSULATION

=begin

- Encapsulation:
  - defines boundaries a program by hiding pieces of functionality and making it unavailable to the rest of the codebase.
  - can be used to hide implementation details from users of a class
    - expose interfaces to interact with objects of that class
      - interfaces = public instance methods
  - it helps to protect data so that data can't be accessed or modified without explicit intent

------------------------
- Allows your code to achieve new levels of complexity
__________________
- define logic only in 1 place, so u can make changes w/o affecting rest of code

=end

class SmartPhone
  # We encapsulate and contain the logic of adding a new contact into this method
  # public interface:
  # This allows users of the class to add a new contact to the contact list, without having to know how the implementation details of how the contact is actually added.
    # Now we have the freedom to modify the data structure that we use to store the list of contacts, while leaving the public interface unchanged.
    # The user only needs to know that they must pass a name and number as an argument, and the logic contained inside of the method will take care of the rest.
  def add_new_contact(name, number)
    @contacts ||= {}
    @contacts[name] = number

    # ex - we could change the data structure to an array:
    @contacts ||= []
    @contacts << [name, number]
  end
end

nexus6 = SmartPhone.new
nexus6.add_new_contact('Fred', '123-456-7890')



