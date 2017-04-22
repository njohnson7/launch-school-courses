# COLLABORATOR OBJECTS

=begin

- any object can be used to represent an object's state
  - ivars can be set to any object, even an object of a custom class
- working w/ collaborator objects is no different than working with core class objects
  - ex: strings, integers, arrays, hashes
- when modeling complex problem domains, using collaborator objects is at the core of OOP, allowing you to split up and modularize the problem domain into cohesive pieces.

=end

class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")
bud = Bulldog.new             # assume Bulldog class from previous assignment

bob.pet = bud

# Because bob.pet returns a Bulldog object, we can then chain any Bulldog methods at the end as well:

bob.pet.speak                 # => "bark!"
bob.pet.fetch                 # => "fetching!"





# Let's now change the implementation a bit to allow a person to have many pets. How should we implement this? How about an array of pets -- that is, an array of Pet objects.

class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets                      # => [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]

# Notice the opening and closing square brackets -- that means this is an array. You can see that the first element in the array is a Cat object while the second element is a Bulldog object. Because it's an array, you cannot just call Pet methods on pets:

bob.pets.jump                  # NoMethodError: undefined method `jump' for [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]:Array

# There is no jump method in the Array class, so we get an error. If we want to make each individual pet jump, we'll have to parse out the elements in the array and operate on the individual Pet object. Here, we'll just iterate through the array.

bob.pets.each do |pet|
  pet.jump
end
