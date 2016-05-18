# practice.rb



# pseudo code example method from assignment:
def find_greatest(numbers)
  return if numbers.nil? || numbers.empty?        # guard clause
  saved_number = numbers.first
  numbers.each do |num|
    next if saved_number >= num
    saved_number = num
  end

  saved_number
end

puts find_greatest([1, 10, 3, 6, 2, 15, 13, 7, 3])        # => 15



# a method that returns the sum of 2 integers:
def sum(num1, num2)
  num1 + num2
end

puts sum(13, 10)



# method that takes ary of strings, and returns a str that is all those strings concatenated together:
def combine_strings(strings)
  comb_str = ''
  strings.each { |str| comb_str << str }
  comb_str
end

puts combine_strings(%w(this is pretty cool))



# method that takes an array of ints, and returns a new ary w/ every other elem:
def every_other(integers)
  new_ary = []
  integers.each_with_index { |int, idx| new_ary << int if idx.even? }
  new_ary
end

p every_other((0..10).to_a)


require 'pry'

class Car
  attr_accessor :brand, :model

  def initialize(new_car)
    @brand = new_car.split(' ').first
    @model = new_car.split(' ').last
    binding.pry
  end

  def display_make_model
    puts "#{brand}: #{model}"
  end

end

betty = Car.new('Ford Mustang')
binding.pry
betty.display_make_model
puts betty.model.start_with?('M')
puts betty.model, betty.brand

pam = Car.new('Honda Civic')
puts pam.model, pam.brand




def integer?(input)
  Integer(input) rescue false
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def number?(input)
  integer?(input) || float?(input)
end



# original valid_dollars? method from mortgage calc, but i refactored it, so maybe save for later in case needed
# checks if a number string is a valid dollar amount
def valid_dollars?(num)
  return true if valid_int?(num)
  if valid_float?(num) # returns true only if there are either 0 or 2 digits after the decimal
    return false if num.split('.').last.length != 2 unless num.split('.').length == 1
    return true
  end
  false
end