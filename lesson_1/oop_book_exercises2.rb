# oop_book_exercises2.rb

module Towable
  def tow_a_trailer
    "You attach a trailer to your vehicle and can now tow it!"
  end
end

class Vehicle
  @@num_of_vehicles = 0

  attr_accessor :year, :model, :color

  def self.gas_mileage(miles, gallons)
    "#{miles.fdiv(gallons).round(2)} mpg"
  end

  def self.display_num_of_vehicles
    puts "Total number of vehicles: #{@@num_of_vehicles}"
  end

  def initialize(y = 1900, m = '!', c = 'pink')
    self.year = y
    self.model = m
    self.color = c
    @speed = 0
    @time_created = Time.now
    @@num_of_vehicles += 1
  end

  def speed_up(num)
    @speed += num
    "You accelerate by #{num} mph. #{current_speed}"
  end

  def brake(num)
    @speed -= num
    "You decelerate by #{num} mph. #{current_speed}"
  end

  def turn_off
    @speed = 0
    "You turn off your #{model}."
  end

  def current_speed
    "Current speed: #{@speed}"
  end

  def spray_paint(c)
    self.color = c
    "You paint your vehicle #{c}."
  end

  def age
      "Your #{model} is #{calculate_age} years old."
  end

  private

  def calculate_age
    # Time.now - @time_created\
    Time.now.year - year
  end
end

class MyCar < Vehicle
  DOORS = 4
  FOUR_WHEEL_DRIVE = false
  HAS_TRUNK = true

  def open_trunk
    "You open your car's trunk."
  end

  def to_s
    "Your car is a #{color} #{year} #{model}."
  end
end

class MyTruck < Vehicle
  DOORS = 2
  FOUR_WHEEL_DRIVE = true
  HAS_TRUNK = false

  include Towable

  def go_offroad
    "You take your truck offroad!"
  end

  def to_s
    "Your truck is a #{color} #{year} #{model}."
  end
end

# puts car = MyCar.new(2000, 'Civic', 'black')
# p car.current_speed
# p car.speed_up(30)
# p car.speed_up(50)
# p car.brake(60)
# p car.turn_off
# p car.spray_paint('blue')
# p car.color
# p car.open_trunk
# Vehicle.display_num_of_vehicles
# p car.age
# puts

# puts truck = MyTruck.new(1999, 'Tacoma', 'grey')
# p truck.current_speed
# p truck.speed_up(30)
# p truck.speed_up(50)
# p truck.brake(60)
# p truck.turn_off
# p truck.spray_paint('blue')
# p truck.color
# p truck.go_offroad
# puts truck
# p truck.age
# puts

# p Vehicle.gas_mileage(300, 7)
# Vehicle.display_num_of_vehicles
# Vehicle.new
# MyCar.new
# MyTruck.new
# Vehicle.display_num_of_vehicles
# puts

# p truck.tow_a_trailer
# p Vehicle.ancestors
# p MyCar.ancestors
# p MyTruck.ancestors
# puts

# lumina = MyCar.new(1997, 'chevy lumina', 'white')
# lumina.speed_up(20)
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.turn_off
# MyCar.gas_mileage(13, 351)
# lumina.spray_paint("red")
# puts lumina
# p lumina.age
# p MyCar.ancestors
# p MyTruck.ancestors
# p Vehicle.ancestors
# p car.age
# p truck.age
# p lumina.age




class Student
  attr_accessor :name

  def initialize(name, grade)
    self.name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  def concat_names(other_student)
    "#{name}, #{other_student.name}"
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new('Joe', 90)
bob = Student.new('Bob', 70)
steve = Student.new('Steve', 80)

puts 'well done!' if joe.better_grade_than?(bob)
puts 'well done!' if steve.better_grade_than?(joe)
# puts joe.grade
p joe.concat_names(bob)
p bob.concat_names(steve)
p bob.concat_names(bob)


# Complete this program so that it produces the expected output:

class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    self.first_name = first_name
    self.last_name = last_name
  end

  def to_s
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person

# expected output:

# John Doe
# Jane Smith