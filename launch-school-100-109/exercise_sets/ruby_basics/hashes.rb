# hashes.rb


# 1. First Car
car = {type: 'sedan', color: 'blue', mileage: 80_000 }
p car
puts



# 2.   Adding the Year
car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000
}
car[:year] = 2003
p car
puts



# 3.   Broken Odometer
car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000,
  year:    2003
}
car.delete(:mileage)
p car
puts



# 4.   What Color?
car = {
  type:    'sedan',
  color:   'blue',
  year:    2003
}
puts car[:color]



# 5.   Labeled Numbers
numbers = {
  high:   100,
  medium: 50,
  low:    10
}
numbers.each { |type, num| puts "A #{type} number is #{num}." }



# 6.   Divided by Two
numbers = {
  high:   100,
  medium: 50,
  low:    10
}
half_numbers = numbers.values.map { |num| num / 2 }
p half_numbers
puts



# 7.   Low, Medium, or High?
numbers = {
  high:   100,
  medium: 50,
  low:    10
}
low_numbers = numbers.select { |type, num| num < 25 }
p low_numbers




# 8.   Low or Nothing
numbers = {
  high:   100,
  medium: 50,
  low:    10
}
low_numbers = numbers.select! do |key, value|
                 value < 25
               end
p low_numbers
p numbers
puts





# 9.   Multiple Cars
multiple_cars = {
  car:   { type: 'sedan', color: 'blue', year: 2003 },
  truck: { type: 'pickup', color: 'red', year: 1998 }
}
p multiple_cars
puts





# 10.  Which Collection?
car = {
  type:  'sedan',
  color: 'blue',
  year:  2003
}
p car.to_a