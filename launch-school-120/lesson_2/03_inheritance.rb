# 03_inheritance.rb

# 1. Class based inheritance works great when it's used to model hierarchical
#     domains. Let's take a look at a few exercises. Suppose we're building a
#     software system for a pet hotel business, so our classes deal with pets.

# Given this class:

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim            # => "swimming!"

# One problem is that we need to keep track of different breeds of dogs, since
# they have slightly different behaviors. For example, bulldogs can't swim, but
# all other dogs can.

# Create a sub-class from Dog called Bulldog overriding the swim method to
# return "can't swim!"

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

bubba = Bulldog.new
p bubba.speak
p bubba.swim
puts




# 2. Let's create a few more methods for our Dog class.

# class Dog2
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end

#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end

#   def fetch
#     'fetching!'
#   end
# end

# Create a new class called Cat, which can do everything a dog can, except swim
# or fetch. Assume the methods do the exact same thing. Hint: don't just copy
# and paste all methods in Dog into Cat; try to come up with some class
# hierarchy.

class Animal
  def speak
    "#{self.class} says:"
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog2 < Animal
  def speak
    "#{super} Arf!"
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    "#{super} Meow!"
  end
end

class Bulldog2 < Dog2
  def swim
    "can't swim!"
  end
end

cat = Cat.new
dog = Dog2.new

p dog.speak
p cat.speak
p dog.run
p cat.run
p dog.fetch
p dog.swim
# p cat.swim
puts

pete = Animal.new
kitty = Cat.new
dave = Dog2.new
bud = Bulldog2.new

p pete.run                # => "running!"
p pete.speak              # "Animal says:"

p kitty.run               # => "running!"
p kitty.speak             # => "meow!"
# p kitty.fetch           # => NoMethodError

p dave.speak              # => "bark!"

p bud.run                 # => "running!"
p bud.swim                # => "can't swim!"
puts



# 3. Draw a class hierarchy diagram of the classes from step #2

# Bulldog < Dog -- Cat < Animal < Object < BasicObject
p Bulldog2.ancestors
p Dog2.ancestors
p Cat.ancestors




# 4. What is the method lookup path and how is it important?

# Method lookup path is the order in which ruby looks up methods when a method
#  is called on an object. First it looks for any methods with that name in the
#  class definition of that object, then if it doesn't find any, it keeps looking
#  further back, starting with the modules included in the class in reverse order,
#  then in the superclass or base class, then in the superclass's included modules,
#  then in the superclass's superclass, and so on, until it gets to Object class,
#  Kernel module, and BasicObject class. You can see the path by calling the class
#  method .ancestors on a class. It is important because it allows for polymorphism,
#  in which classes can have methods that have the same name as methods in modules
#  or superclasses, but have different behaviors depending on the class itself.
#  It is also important because it allows us to know where methods come from.
#  The classes/modules that come first on the lookup path override any methods
#  further on in the lookup path with the same name.

# Book answer:
#  It is the order in which Ruby will traverse the class hierarchy to look for
#   methods to invoke. If you have a method like swim that you call on a Bulldog
#   instance, Ruby will first look for that method in the Bulldog class, then
#   traverse up the chain of superclasses, and invoke the first method called
#   swim, then stop its traversal
