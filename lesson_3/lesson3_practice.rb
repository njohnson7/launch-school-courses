# lesson3_practice.rb

module Swim
  attr_reader :can_swim

  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    'swimming!' if @can_swim
  end
end

fido = Dog.new
p fido.swim
p fido.enable_swimming
p fido.swim
p fido.can_swim
puts




class Animal
  @@total_animals = 0

  def self.total_animals
    @@total_animals
  end
end

class Cat < Animal
  def total_animals
    @@total_animals
  end
end

p Animal.total_animals
p cat = Cat.new
p cat.total_animals

class Animal
  def initialize
    @@total_animals += 1
  end
end

p Animal.total_animals
p cat = Cat.new
p cat.total_animals
puts



class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

class Car < Vehicle
  def wheels
    @@wheels
  end
end

p Vehicle.wheels
p Car.new.wheels

class Motorcycle < Vehicle
  @@wheels = 2
  def wheels
    @@wheels
  end
end

p Motorcycle.wheels
p Vehicle.wheels
p Car.new.wheels
puts



class Dogger
  LEGS = 4
end

class Catter
  def legs
    Dogger::LEGS
  end
end

cat = Catter.new
p cat.legs

class Ratter < Dogger
  def legs
    LEGS
  end
end

rat = Ratter.new
p rat.legs

module Beef
  BEEF = 'BEEF'
  @beef = false

  def got_beef
    @beef = true
    BEEF
  end
end

class Cow
  include Beef

  def beef?
    @beef
  end

  def beefers
    BEEF + "!!!"
  end
end

cow = Cow.new
p cow.beef?
p cow.got_beef
p cow.beef?

class Bull < Cow
  def self.beeef
    BEEF.gsub('E', 'EE')
  end
end

bull = Bull.new
p bull.got_beef
p bull.beefers
p Bull.beeef
puts




module Maintenance
  WHEELS = 2
  def change_tires
    "Changing #{WHEELS} tires."               # 2
    "Changing #{Automobile::WHEELS} tires."   # 4
    "Changing #{Sedan::WHEELS} tires."        # 2
  end

  def change_doors
    # "Changing #{DOORS} doors."            # error
    "Changing #{Automobile::DOORS} doors."  # ok
    "Changing #{Sedan::DOORS} doors."       # ok
  end
end

class Automobile
  WHEELS = 4
  DOORS = 4
end

class Sedan < Automobile
  include Maintenance
end

sedan = Sedan.new
p sedan.change_tires
p sedan.change_doors