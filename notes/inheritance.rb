# INHERITANCE

=begin

Inheritance:
  - a relationship b/w two or more classes:
    - a single superclass:
      - large reusability
    - one or more subclasses:
      - specialized behavior
  - each subclass gains access to (inherits) all the superclass's:
    - instance/class methods
    - constants
    - class variables
  - Single inheritance:
    - a subclass can only have one superclass
    - a superclass can have multiple subclasses
  - A way to apply polymorphic structure to a program
- use inheritance to extract common behaviors from classes that share that behavior, and move it to a superclass
  - this lets us extract logic to one place for re-use
    - removes duplication in your code base
    - DRY: every piece of knowledge should have a single, authoritative, unambiguous representation in a system
- use the < char to indicate inheritance
- hierarchical ('is-a') relationships




=end

class Phone
  def call
    'calling...'
  end
end

class SmartPhone < Phone
  def open_app
    'opening app...'
  end
end

class PayPhone < Phone
  def insert_money
    'inserting money...'
  end
end