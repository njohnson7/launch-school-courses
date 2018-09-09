# oop_book_exercises.rb

# module Run
#   def run
#     'ran 20 meters'
#   end
# end

# class BadDog
#   include Run
# end

# class GoodDog
# end

# module Animal
#   class BadDog
#     include Run
#   end

#   class Cat
#   end

#   NAME = 'animal'
# end



# p spot = BadDog.new
# p spot.run
# p fido = GoodDog.new
# # p fido.run #=> ERROR
# puts

# p topher = Animal::BadDog.new
# p topher.run
# p Animal::NAME
# p cat = Animal::Cat.new
# # p cat2 = Cat.new #=> ERROR
# # p cat.run #=> ERROR



# class GoodDog
#   def initialize(name, age)  # constructor method
#     puts 'A NEW GOOD DOG IS BORN!'
#     @name = name
#     @age = age
#     @type = 'GoodDog'
#   end

#   def speak
#     puts "#{@name}: #{'Arf! ' * rand(1..4)}"
#   end

#   def display_age
#     puts "#{@name} is #{@age} years old."
#   end

#   def name
#     @name
#   end

#   def name=(n)
#     @name = n
#   end

#   def age=(a)
#     @age = a
#   end

#   def age
#     @age
#   end
# end

class GoodDog
  attr_accessor :name, :age, :ssn, :weight, :height
  # attr_reader :weight
  attr_writer :color

  def initialize(name, age = 22)
    puts 'A NEW GOOD DOG IS BORN!'
    @name = name
    @age = age
    @weight = 200
    @ssn = '123-456-7890'
  end

  def speak
    puts "#{name}: '#{'Arf! ' * rand(1..4)}'"
  end

  def display_age
    puts "#{name} is #{age} years old."
  end

  def ssn
    "XXX-XXX-#{@ssn[-4, 4]}"
  end

  def display_ssn
    puts ssn
  end

  def gain_weight
    @weight += 10
    name << '1'
    p weight + 10
  end

  def change_info(n, h, w)
    @name = n
    @height = h
    @weight = w
  end
end

# p sparky = GoodDog.new('Sparky', 13)  # instantiation
# p fido = GoodDog.new('FIDO')
# puts

# sparky.speak
# fido.speak
# puts

# sparky.display_age
# fido.display_age
# puts

# p sparky.name
# p fido.name
# puts

# sparky.name=('Sparkz')
# p sparky.name
# p sparky
# puts

# fido.name = 'Fidough'
# fido.display_age
# puts

# p sparky.name = 'SPARKERINO'
# p sparky.age = 192
# p sparky.age
# puts

# p test=('test')
# puts

# p sparky.weight
# p fido.weight
# p sparky.color = 'brown'

# p sparky.ssn
# sparky.display_ssn
# p sparky.ssn = '000-111-2244'
# sparky.display_ssn
# puts

# p sparky.gain_weight
# p sparky.name.object_id
# p sparky.name.object_id
# puts

# p sparky.change_info('Sprrrky', 131, 15)
# p sparky.name
# p sparky.height
# p sparky.weight


class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    puts "#{name} says 'Arf!'"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def display_info
    puts "#{name} is #{self.height} foot tall and weighs #{weight} pounds."
  end

  def test
    'test'
  end

  def display_test
    p test
  end
end

# sparky = GoodDog.new('Sparky', 1, 10)
# sparky.display_info
# sparky.speak
# sparky.change_info('SPARKZ', 2, 22)
# sparky.display_info
# sparky.speak
# p sparky.test
# sparky.display_test




class MyCar
  attr_accessor :year, :color, :model, :speed, :running

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @running = true
  end

  def info
    "#{year} #{color} #{model} - #{speed} mph"
  end

  def speed_up(n)
    self.speed += n
  end

  def brake(n)
    self.speed -= n
  end

  def turn_off
    self.speed = 0
    self.running = false
  end
end

# car = MyCar.new(2000, 'grey', 'Honda Civic')
# p car.info
# p car.speed
# car.speed_up(20)
# p car.speed
# car.speed_up(20)
# car.speed_up(20)
# car.speed_up(20)
# p car.info
# car.brake(50)
# p car.info
# p car.running
# car.turn_off
# p car.running
# p car.info

module SprayPaint
  def spray_paint(color)
    self.color = color
    puts 'you painted your car ' + color
  end
end

class MyCar
  attr_accessor :color
  attr_reader :year

  include SprayPaint

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @running = true
  end

  def info
    "#{year} #{color} #{@model} - #{@speed} mph"
  end

  def speed_up(n)
    @speed += n
    puts "you accelerate #{n} mph"
  end

  def brake(n)
    @speed -= n
    puts "you brake by #{n} mph"
  end

  def display_current_speed
    puts "you are now going #{@speed} mph"
  end

  def turn_off
    @speed = 0
    @running = false
    puts "You turn the car off"
  end
end

# car = MyCar.new(2000, 'grey', 'Honda Civic')
# p car.info
# car.display_current_speed
# car.speed_up(20)
# car.display_current_speed
# car.speed_up(20)
# car.speed_up(20)
# car.speed_up(20)
# car.display_current_speed
# car.brake(50)
# car.display_current_speed
# p car.running
# car.turn_off
# p car.running
# car.display_current_speed
# car.color = 'Blue'
# p car.color
# p car.year
# car.spray_paint('black')
# p car.color



class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age, :test

  @@number_of_dogs = 0

  def initialize(n = 'bernie', a = 6)
    self.name = n
    self.age  = a * DOG_YEARS
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end

  def self.nam=(n)
    @@nam = n
  end

  def self.nam
    @@nam
  end

  def change_age
    self.age = 100
  end

  def self.what_am_i
    "I'm a #{self} class!" # reference self in a class method => GoodDog (class name)
  end

  def GoodDog.who_am_i # same as self.who_am_i
    'good dog!!!'
  end

  def to_s
    "the dog's name is #{name} and it is #{age} dog years old."
  end

  def what_is_self
    self
  end

  def tester
    @@number_of_dogs
  end
end

# p GoodDog.total_number_of_dogs
# spot = GoodDog.new('Spot')
# p GoodDog.what_am_i
# p GoodDog.total_number_of_dogs
# fido = GoodDog.new('fiderino', 10)
# p GoodDog.total_number_of_dogs
# p fido.name
# p GoodDog.new
# p GoodDog.total_number_of_dogs
# p GoodDog::DOG_YEARS
# p fido.age
# p spot.age
# p spot
# p spot.to_s
# puts spot
# puts spot.inspect
# p "spot is a #{spot}"
# p spot.what_is_self
# p spot
# puts spot.what_is_self
# p spot.inspect
# p GoodDog.who_am_i
# p spot.change_age
# puts
# p GoodDog
# p GoodDog.nam = 'fred'
# p GoodDog.nam
# p GoodDog.what_am_i
# p spot.test
# spot.test = 'test'
# p spot.test
# p spot.tester



class MyCar
  attr_accessor :year, :color, :model, :speed

  @@num_of_cars = 0

  def initialize(year, color, model)
    self.year = year
    self.color = color
    self.model = model
    self.speed = 0
    @@num_of_cars += 1
  end

  def self.num_of_cars
    "Total num of cars: #{@@num_of_cars}"
  end

  def self.gas_mileage(miles, gallons)
    "Gas mileage: #{miles.fdiv(gallons)} mpg"
  end

  def spray_paint(color)
    self.color = color
    "You painted your car #{color}"
  end

  def speed_up(num)
    self.speed += num
    "you accelerate by #{num} mph"
  end

  def brake(num)
    self.speed -= num
    "you DEcelerate by #{num} mph"
  end

  def current_speed
    "Current speed: #{speed} mph"
  end

  def turn_off
    self.speed = 0
    "You turned off your #{model}"
  end

  def to_s
    "Year: #{year}, Color: #{color}, Model: #{model}, Current speed: #{speed}"
  end

  def self.to_s
    "MY CAR CLASS!"
  end
end

# p civic = MyCar.new(2000, 'grey', 'Civic')
# p civic.current_speed
# p civic.speed_up(30)
# p civic.speed_up(50)
# p civic.current_speed
# p civic.brake(50)
# p civic.current_speed
# p civic.turn_off
# p civic.current_speed
# p civic.spray_paint('yellow')
# p civic
# p MyCar.num_of_cars
# p MyCar.gas_mileage(190, 4)
# puts civic
# puts MyCar
# p MyCar
# p MyCar.to_s
# p civic.to_s



class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

# p bob = Person.new("Steve")
# p bob.name = "Bob"




# module Swimmable
#   def swim
#     "I'm swimming!"
#   end

#   class SwimmingCat
#   end
# end

# class Animal
#   attr_accessor :name

#   def initialize(name)
#     self.name = name
#   end

#   def speak
#     'Hello!'
#   end
# end

# class Fish < Animal
#   include Swimmable
# end

# class Dog < Animal
#   include Swimmable

#   def initialize(color)
#     super
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class BadDog < Animal
#   include Swimmable

#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end

# sparky = Dog.new('sparky')
# # p sparky
# cat = Cat.new('caaat')
# # # p cat
# # p sparky.speak
# # # p cat.speak
# p bear = BadDog.new(2, 'bear')
# # p bear.name
# # p bear.name = 'BEAR'
# # p bear.name

# p fish = Fish.new('fishy')
# p fish.swim
# p sparky.swim
# p swim_cat = Swimmable::SwimmingCat.new






module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal and I speak!"
  end
end

class Cat < Animal
  include Climbable
end

class Dog < Animal
  include Swimmable
  include Climbable
end

# cat = Cat.new
# p cat.walk
# p cat.speak
# p cat.climb
# p Animal.ancestors
# p Cat.ancestors
# p Dog.ancestors
# p Dog.new.swim


module Mammal
  class Dog
    def speak(sound)
      p sound
    end
  end

  class Cat
    def meow
      p 'Meowwww!'
    end
  end

  def self.some_out_of_place_method(num)
    num.abs2
  end
end

# cat = Mammal::Cat.new
# dog = Mammal::Dog.new
# cat.meow
# dog.speak('Woof!')

# value = Mammal.some_out_of_place_method(4)
# p value
# value2 = Mammal::some_out_of_place_method(5)
# p value2


class BadDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def display_human_years
    # CANT USE SELF ON PRIVATE METHODS!:
      # "#{name} in human years is #{self.human_years}"
    "#{name} in human years is #{human_years}"
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

# rufus = BadDog.new('Rufus', 6)
# p rufus
# p rufus.human_years rescue p 'private method!'
# p rufus.display_human_years

class Bear
  def a_public_method
    'will this work? (self): ' + self.a_protected_method + "\n" +
      'will this work? (w/o self): ' + a_protected_method
  end

  def a_public_method_private
    # 'will this work? (self): ' + self.a_private_method + "\n" + # NOPE!
      'will this work? (w/o self): ' + a_private_method
  end

  protected

  def a_protected_method
    'YES IM PROTECTED'
  end

  private

  def a_private_method
    'Maybe, IM PRIVATE'
  end
end


# bear = Bear.new
# puts bear.a_public_method
# p bear.a_protected_method rescue p "Can't call protected method outside of class!"
# p bear.a_public_method_private




class Parent
  def say_hi
    p 'hi from parent'
  end
end

p Parent.superclass

class Child < Parent
  def say_hi
    p 'hi from child'
  end

  def send
    p 'send from child'
  end

  def instance_of?
    p 'i am a fake instance'
  end
end

child = Child.new
p Child.superclass
child.say_hi

son = Child.new
# son.send :say_hi
son.send

# p son.instance_of? Child
# p son.instance_of? Parent
p son.is_a? Child
p son.is_a? Parent
son.instance_of?