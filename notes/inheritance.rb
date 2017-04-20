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


Instead of doing it this way, do this isntead
  - ex: classes w/ repeated methods, then include modules
  - ex: manual getter/setter, vs class macro

- more examples instead of definitions!
  - just add keyterms, like is-a vs has-a


TOPICS:
 - state vs behavior
   - ivars are for specific instance, methods shared

 -SEE NOTES!


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