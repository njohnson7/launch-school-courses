# ENCAPSULATION

=begin

- defines boundaries
  - hide pieces of functionality and make unavailable to rest of codebase
- data protection (can't be modified w/o obvious intention)
- creating objects and exposing interfaces (public methods) to interact w/ them
  - new level of abstraction and complexity
- hide implementation details
  - prevent ripple effects of change
- divide responsibilities
- define logic in 1 place
  - interface can remain same while implemntation changes
- ex:
  - objects encapsulate state
  - methods (black box)

=end

# ivars encapsulate the state of an object:
class SmartPhone
  def initialize(model)
    @model = model
  end
end

nexus6 = SmartPhone.new('Nexus 6')



class SmartPhone
  def text(msg, number)
    "Sending '#{msg}' to #{number}..."
    send_text(msg, number)
  end

  private

  def send_text(msg, number)
    # implementation details...
  end
end



class SmartPhone
  # We encapsulate and contain the logic of adding a new contact into this method
  # public interface:
  # This allows users of the class to add a new contact to the contact list, without having to know how the implementation details of how the contact is actually added.
    # Now we have the freedom to modify the data structure that we use to store the list of contacts, while leaving the public interface unchanged.
    # The user only needs to know that they must pass a name and number as an argument, and the logic contained inside of the method will take care of the rest.
  def add_new_contact(name, number)
    # option 1 - hash:
    @contacts ||= {}
    @contacts[name] = number

    # option 2 - array:
    @contacts ||= []
    @contacts << [name, number]
  end
end

nexus6 = SmartPhone.new
# The public interface will not be affected by what data structure we decide to use:
nexus6.add_new_contact('Fred', '123-456-7890')


