# 04_collaborator_objects.rb

class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

joe = Person.new('Joe')
p joe.name
puts




class Person2
  def initialize
    @heroes = %w[Superman Spiderman Batman]
    @cash = { ones: 12, fives: 2, tens: 0, twenties: 2, hundreds: 0}
  end

  def cash_on_hand
    cash = [1, 5, 10, 20, 100].zip(@cash.values)
                              .map { |value, amount| value * amount }
                              .reduce(:+)
    "$#{cash}.00"
  end

  def heroes
    @heroes.join(', ')
  end
end

joe = Person2.new
p joe.cash_on_hand
p joe.heroes
puts



class Person3
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end

  def pet_str
    "#{name}'s pet is a #{pet}"
  end
end

class Bulldog
  def initialize(name)
    @name = name
  end

  def speak
    'Arf!'
  end

  def fetch
    'fetching!'
  end

  def to_s
    "#{self.class} named #{@name}"
  end
end

bob = Person3.new('Bob')
bubba = Bulldog.new('Bubba')

bob.pet = bubba
p bob.pet
puts bob.pet
p bob.pet_str
p bob.pet.class
p bob.pet.speak # chaining Bulldog methods onto bob's @pet object
p bob.pet.fetch
puts




class Person4
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Cat
  def speak
    'meow!'
  end

  def to_s
    'Caaat!!!'
  end
end

bob = Person4.new('Bob')
bob.pets << Bulldog.new('Bubba') << Cat.new << Cat.new
p bob.pets
bob.pets.each { |pet| p pet.speak }
p bob.pets.map(&:to_s)
