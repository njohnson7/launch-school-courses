# 05_modules.rb


module Swimmable
  def swim
    'swimming!'
  end
end

class Pet
  def wow
    'oh wow!'
  end
end

class Mammal < Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Fish < Pet
  include Swimmable
end

class Cat < Mammal
  def speak
    'meow!'
  end
end

class Dog < Mammal
  include Swimmable

  def speak
    'woof!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

pet = Pet.new
mammal = Mammal.new
fish = Fish.new
cat = Cat.new
dog = Dog.new
bulldog = Bulldog.new

p pet.wow
p mammal.wow
p mammal.run
p mammal.jump
p fish.swim
p fish.wow
p cat.speak
p dog.speak
p dog.fetch
p dog.swim
p bulldog.speak
p bulldog.fetch
p bulldog.swim
p bulldog.wow
p Bulldog.ancestors
p Fish.ancestors
p Cat.ancestors
