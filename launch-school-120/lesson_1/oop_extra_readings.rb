# # oop_practice.rb

# class Box
#   @@count = 0

#   # attr_accessor :width, :height

#   def self.count
#     "Box count: #{@@count}"
#   end

#   def initialize(w, h)
#     @width = w
#     @height = h
#     @@count += 1
#   end

#   def width
#     @width
#   end

#   def height
#     @height
#   end

#   def width=(num)
#     @width = num
#   end

#   def height=(num)
#     @height = num
#   end

#   def area
#     width * height
#   end

#   def to_s
#     "Width: #{width}, Height: #{height}"
#   end

#   def test_public
#     test_protect
#   end

#   protected

#   def test_protect
#     'test'
#   end

# end

# box1 = Box.new(5, 10)
# p box1
# p box1.width
# p box1.height
# box1.width = 3
# box1.height = 5
# p box1
# p box1.area
# p Box.count
# Box.new(1,2)
# p Box.count
# p box1
# puts box1
# p box1.test_public

class Box
  attr_accessor :width, :height

  def initialize(w, h)
    @width = w
    @height = h
  end

  def area
    width * height
  end

  def to_s
    "Width: #{width}, Height: #{height}"
  end

  def +(other)
    Box.new(width + other.width, height + other.height)
  end

  def *(scalar)
    Box.new(width * scalar, height * scalar)
  end

  def -@
    Box.new(-width, -height)
  end
end


# box1 = Box.new(5,10)
# box2 = Box.new(20, 40)
# p box1 + box2
# p -box1
# p box1 * 3
# box3 = Box.allocate
# # p box3 + box1

module Doubleable
  def double
    puts 'DOUBLED!'
  end
end

# class Circle
#   PI = Math::PI

#   def initialize(radius)
#     @radius = radius
#     puts 'a circle is created'
#   end

#   def area
#     PI * @radius.abs2
#   end
# end

# class HalfCircle < Circle
#   include Doubleable

#   def initialize(radius)
#     super
#     puts 'and it is cut in half'
#   end
# end

# c = Circle.new(5)
# p c.area

# h = HalfCircle.new(2.5)
# p h.area

# h.double


class Person
  def initialize(name)
    @name = name
  end
end

class Woman < Person
  def initialize(name, age)
    @gender = 'female'
    @age = age
    super(name)
  end
end

# p bob = Person.new('Bob')
# p pam = Woman.new('Pam', 23)


class Base
  def show(x = 0, y = 0)
    p "Base class, x: #{x}, y: #{y}"
  end
end

class Derived < Base
  attr_reader :name
  attr_writer :type

  def show(x, y)
    super
    super(x)
    super(x, y)
    super()
  end
end

# d = Derived.new
# d.show(3, 5)
# p d.name
# p d.type = 'cool'


class Car
  NAME = 'carrr'

  attr_accessor :name, :price

  def to_s
    "#{name}: #{price}"
  end
end

# c1 = Car.new
# c2 = Car.new

# c1.name = 'Civic'
# c1.price = 23_000
# puts c1
# puts c2
# p c2.name
# p c2.price
# c2.name = 'Ninja'
# puts c2
# c2.price = 800
# puts c2

# p c1.name
# p c2.price
# p Car::NAME
# puts c2
# puts c2.to_s




class Circle
  include Math

  attr_accessor :radius

  def self.info
    "This is a Circle class"
  end

  class << self
    def to_s
      "Circle class string"
    end
  end

  def initialize(r)
    @radius = r
  end

  def area
    PI * radius**2
  end

  def +(other)
    Circle.new(radius + other.radius)
  end

  def to_s
    "Circle with radius: #{radius}"
  end
end

# c1 = Circle.new(5)
# c2 = Circle.new(10)
# puts c1
# puts c2
# c3 = c1 + c2
# puts c3
# p Circle.info
# p c1.area
# puts Circle

# include Math
# p PI
# p sqrt(25)
# p Object.ancestors



Dog = Struct.new(:name, :color) do
  def bark
    puts "Arf! Arf!"
  end

  def run
    puts "#{self.class.name} runs around excitedly!"
  end

  def to_s
    "#{name} is a #{color} dog"
  end
end

# fido = Dog.new('Fido', 'brown')
# fido.bark
# p fido.name = 'FIDO'
# p fido.name
# p fido <=> fido
# spot = Dog.new('SPOT', 'black')
# p fido <=> spot

# def fido.run
#   puts "fido runs!"
# end

# fido.run
# p fido
# p Dog.inspect
# puts fido

class Puppy < Dog
  def bark
    puts 'yip! yip!'
  end
end

# tony = Puppy.new('Tony', 'blue')
# tony.bark
# puts tony
# puts fido
# puts

# [Dog.new('fido'), Puppy.new('puppers')].each do |dog|
#   dog.bark
#   dog.run
# end

class Crazy
  def test
    self.class.name
  end
end

# p Crazy.new.test.inspect



module Forest

    class Rock ; end
    class Tree ; end
    class Animal ; end

end

module Town

   class Pool ; end
   class Cinema ; end
   class Square ; end
   class Animal ; end

end


# p Forest::Tree.new
# p Forest::Rock.new
# p Town::Cinema.new

# p Forest::Animal.new
# p Town::Animal.new




module Device
  def switch_on()  puts 'on'  end
  def switch_off() puts 'off' end
end

module Volume
  def volume_up()   puts 'volume up'   end
  def volume_down() puts 'volume down' end
end

module Pluggable
  def plug_in()  puts 'plug in'  end
  def plug_out() puts 'plug out' end
end

module Extremeable
  def do_extreme_stuff
    puts 'You do some extreme stuff! oh wow!'
  end
end

class CellPhone
  include Device, Volume
  include Pluggable

  def ring() puts 'ringing' end
end

class SmartPhone < CellPhone
  include Extremeable

  def browse_web
    puts "you browse the web on your #{self.class.name}"
  end
end

# cell = CellPhone.new
# cell.switch_on
# cell.volume_down
# cell.plug_in
# cell.ring
nexus = SmartPhone.new
nexus.browse_web
nexus.do_extreme_stuff
p SmartPhone.ancestors

# x = 35
# y = 0

# begin
#   z = x / y
#   puts z
# rescue => e
#   puts e
#   p e
# end

# 4 / 0 rescue p ZeroDivisionError



# age = 17

# p $!

# begin
#   if age < 18
#     raise 'Person is a minor'
#   end

#   puts 'Entry Allowed'
# rescue => e
#   puts e
#   p e
#   exit 1
# end

# # puts 1


# begin
#   f = File.open('stones', 'r')
#   puts line while line = f.gets
# rescue => e
#   puts e
#   p e
# ensure
#   f.close if f
# end



# class BigValueError < StandardError ; end

# LIMIT = 333
# x = 3_432_453

# begin
#   raise BigValueError, 'Exceeded max value' if x > LIMIT
#   puts 'script continues'
# rescue => e
#    puts e
#    p e
#    exit 1
# ensure
#   puts 'Crazy'
# end


# cities_and_states = {
#     :austin => 'texas',
#     :chicago => 'illinois',
#     :nashville => 'tennessee',
#     :dallas => 'texas',
#     :houston => 'texas',
#     :asheville => 'north_carolina'
# }

# def a_cities(cities_and_states)
#   cities = cities_and_states.keys.map(&:to_s)
#   puts "here are the cities in the original array: #{cities}"
#   a_cities_list = []
#   cities.each do |city|
#     # if cities.index(city.split('')[0] == "a" )
#     if city.start_with?('a')
#       a_cities_list << city
#       # city = true
#       # p a_cities
#     end
#   end
#   a_cities_list
# end





# p a_cities(cities_and_states)

# cities_and_states = {
#     :austin => 'texas',
#     :chicago => 'illinois',
#     :nashville => 'tennessee',
#     :dallas => 'texas',
#     :houston => 'texas',
#     :asheville => 'north_carolina'
# }

# cities_and_states.each do |city, state|
#     puts "#{city} is in #{state}"
# end

# # p cities_and_states.reject { |k, v| v == 'texas'}
# p cities_and_states.each { |k, v| cities_and_states.delete(k) if v == 'texas' }
# p cities_and_states


#  def where
#     cities_and_states = {
#     "austin" => "texas",
#     "chicago" => "illinois",
#     "nashville" => "tennessee",
#     "dallas" => "texas",
#     "houston" => "texas",
#     "asheville" => "north carolina"
# }
#   cities_and_states.each do |city, state|
#       puts "#{city} is in #{state}"
#   end
# end

# where



# def where
#   cities_and_states = {
#     "austin" => "texas",
#     "chicago" => "illinois",
#     "nashville" => "tennessee",
#     "dallas" => "texas",
#     "houston" => "texas",
#     "asheville" => "north carolina"
#   }
#   cities_and_states.each do |city, state|
#     puts "#{city} is in #{state}"
#     #if in symbol will need to be put in string to
#   end

# #    cities_and_states.each do |city|
# #   p city.split
# # end
# end

# where

# def delete_texas(places_hash)
#   places_hash.delete_if {|city, state| state == "texas"
#     }
#   return places_hash
# end
# cities_and_states = {
#     "austin" => "texas",
#     "chicago" => "illinois",
#     "nashville" => "tennessee",
#     "dallas" => "texas",
#     "houston" => "texas",
#     "asheville" => "north carolina"
#   }
# p delete_texas(cities_and_states)



# city_state = {
#   texas: ["austin","dallas","houston"],
#   illinois: ["chicago","springfield"],
#   tennessee: ["nashville","memphis"],
#   north_carolina: ["asheville"]
# }

# non_texas = city_state.select do |state,city|
#   state != :texas
# end
# arr = non_texas.values
# p arr
# arr = non_texas.values.flatten!
# puts arr
# array_flat = non_texas.values.flatten