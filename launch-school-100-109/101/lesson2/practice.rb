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



# original find_match_result method from rock paper scissors practice:
def find_match_result(comp_choice, user_choice)
  if comp_choice == user_choice then 'tie'
  elsif (comp_choice == 'rock' && user_choice == 'paper') ||
        (comp_choice == 'paper' && user_choice == 'scissors') ||
        (comp_choice == 'scissors' && user_choice == 'rock')
    'win'
  else 'lose'
  end
end
# also this one:
  # result = case comp_choice
  #          when user_choice then 'tie'
  #          when 'rock' then 'win' if user_choice == 'paper'
  #          when 'paper' then 'win' if user_choice == 'scissors'
  #          when 'scissors' then 'win' if user_choice == 'rock'
  #          end
  # result || 'lose'




# original num_to_dollars method from mortgage_calculator.rb:
def num_to_dollars(num)
  num_str = num.to_f.to_s
  num_ary = num_str.split('.')
  if num_ary.last.length == 1 # adds a zero if there is only 1 number in after the decimal
    num_ary.last << '0'
  elsif num_ary.last.length > 2 # removes any numbers longer than 2 places after decimal
    num_ary[1] = num_ary[1][0] + num_ary[1][1]
  end

  num_ary[0] = add_commas(num_ary.first) if num_ary.first.length > 3 # adds commas to numbers before decimal

  num_str = num_ary.join('.')
  num_str.prepend('$') # adds dollar sign before number
end


# original add_commas method from mortgage calc:
def add_commas(num)
  ary = num.split('')
  ary_commas = []
  ary_copy = ary.map { |n| n }
  counter = 1
  ary.each do
    ary_commas << ary_copy.pop
    ary_commas << ',' if counter % 3 == 0
    counter += 1
  end
  ary_commas.reverse!
  ary_commas.delete_at(0) if ary_commas.first == ','
  ary_commas.delete_at(-1) if ary_commas.last == ','
  ary_commas.join
end


# original valid_dollars? from mortgage calc:
def valid_dollars?(num)
  if valid_int?(num)
    return true
  elsif valid_float?(num)
    # returns true only if there are either 0 or 2 digits after the decimal
    return true if num.split('.').last.length == 2 || num.split('.').length == 1
  end
  false
end

# org valid_apr from mortgage:
def valid_apr?(apr)
  if valid_int?(apr) || valid_float?(apr)
    apr_ary = apr.split('.')
    if apr_ary.first.length > 2
      return false
    else
      return true
    end
  end
  false
end





# orig win? method from RPS lizard spock
def win?(comp_choice, user_choice)
  (user_choice == 'rock' && (comp_choice == 'scissors' || comp_choice ==
   'lizard')) ||
    (user_choice == 'paper' && (comp_choice == 'rock' || comp_choice ==
     'Spock')) ||
    (user_choice == 'scissors' && (comp_choice == 'paper' || comp_choice ==
     'lizard')) ||
    (user_choice == 'lizard' && (comp_choice == 'paper' || comp_choice ==
     'Spock')) ||
    (user_choice == 'Spock' && (comp_choice == 'rock' || comp_choice ==
     'scissors'))
end

# orig outcome_msg method from RPS liz spock:
def outcome_msg(comp_choice, user_choice)
  choices = comp_choice, user_choice

  if choices.include?('rock') && choices.include?('scissors')
    'Rock smashes scissors'
  elsif choices.include?('rock') && choices.include?('lizard')
    'Rock smashes lizard'
  elsif choices.include?('rock') && choices.include?('paper')
    'Paper covers rock'
  elsif choices.include?('rock') && choices.include?('Spock')
    'Spock vaporizes rock'
  elsif choices.include?('paper') && choices.include?('Spock')
    'Paper disproves Spock'
  elsif choices.include?('paper') && choices.include?('scissors')
    'Scissors cuts paper'
  elsif choices.include?('paper') && choices.include?('lizard')
    'Lizard eats paper'
  elsif choices.include?('scissors') && choices.include?('lizard')
    'Scissors decapitates lizard'
  elsif choices.include?('scissors') && choices.include?('Spock')
    'Spock smashes scissors'
  elsif choices.include?('lizard') && choices.include?('Spock')
    'Lizard poisons Spock'
  else
    "You both picked #{comp_choice}"
  end
end