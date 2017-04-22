# METHOD OVERRIDING

=begin

- defining a method in a class that has the same name as a method further up in method lookup path
  - Ruby will invoke the method in the class, without even checking if it exists in the ancestors
- ACCIDENTAL METHOD OVERRIDING:
  - overriding a method inherited from Object can have far-reaching effects on your code
    - ex - Object#send :
      - a way to call a method by passing it a symbol/string w/ the method name
    - ex - Object#instance_of? :
      - returns true if an object is an instance of passed in class argument
  - Object#to_s is an instance method that can be overriden w/o any major side-effect
    - do this when you want a custom string representation of an object

=end

# how it normally works:
son.send :say_hi       # => "Hi from Child."

# override:
class Child
  def say_hi
    p "Hi from Child."
  end

  def send
    p "send from Child..."
  end
end

# how it works after:
lad = Child.new
lad.send :say_hi

# ArgumentError: wrong number of arguments (1 for 0)
# from (pry):12:in `send'



c = Child.new
c.instance_of? Child      # => true
c.instance_of? Parent     # => false

class Child
  # other methods omitted

  def instance_of?
    p "I am a fake instance"
  end
end

heir = Child.new
heir.instance_of? Child

# ArgumentError: wrong number of arguments (1 for 0)
# from (pry):22:in `instance_of?'
