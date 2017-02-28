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
puts




class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other)
    age > other.age
  end

  def <(other)
    age < other.age
  end

  def under_18?
    age < 18
  end

  def to_s
    name
  end
end

bob = Person.new('Bob', 22)
joe = Person.new('Joe', 33)
p bob > joe
p joe > bob
p bob < joe
p joe < bob
puts


class Team
  attr_accessor :name, :members

  def initialize(name, members = [])
    @name = name
    @members = members
  end

  def <<(person)
    return if person.under_18?
    members << person
  end

  def +(other)
    Team.new("#{name} & #{other.name}", members + other.members)
  end

  def [](idx)
    members[idx]
  end

  def []=(idx, person)
    members[idx] = person
  end

  def to_s
    "#{name}: [#{members.join(', ')}]"
  end
end

teamsters = Team.new('Teamsters')
p teamsters.members
teamsters << bob << joe
p teamsters.members
sam = Person.new('Sam', 15)
p teamsters << sam
p teamsters.members
puts

fred = Person.new('Fred', 99)
eric = Person.new('Eric', 120)
sammy_boy = Person.new('Sammy Boy', 74)
cool_guys = Team.new('Cool Guys')
cool_guys << fred << eric << sammy_boy
puts teamsters
puts cool_guys
puts teamsters + cool_guys
puts

best_team = teamsters + cool_guys
puts best_team
puts best_team[4]
p best_team[0] = Person.new('Tony', 88)
# p best_team
puts best_team