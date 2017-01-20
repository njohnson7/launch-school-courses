# easy2.rb

# 1.  How old is Teddy?
def age
  age = rand(20..200)
  puts "Teddy is #{age} years old!"
end

age # Teddy is 69 years old!
puts



# 2.  How big is the room?
def room
  puts 'Enter the length of the room in meters:'
  length = gets.to_f
  puts 'Enter the width of the room in meters:'
  width = gets.to_f
  area_meters = length * width
  area_feet = (area_meters * 10.7639).round(2)
  puts "The area of the room is #{area_meters} square meters (#{area_feet} square feet)."
end

# room



# 3.  Tip calculator
def tip
  puts 'What is the bill?'
  bill = gets.to_i
  puts 'What is the tip percentage?'
  percent = gets.to_f * 0.01

  tip = (bill * percent)
  total = (tip + bill)

  puts "The tip is $#{format('%.2f', tip)}"
  puts "The total is $#{format('%.2f', total)}"
end

# tip



# 4.  When will I Retire?
def retire
  puts 'What is your age?'
  age_now = gets.to_i
  puts 'At what age would you like to retire?'
  age_retire = gets.to_i

  years_left = age_retire - age_now
  year_now = Time.now.year
  year_retire = year_now + years_left

  puts "It's #{year_now}. You will retire in #{year_retire}."
  puts "You have only #{years_left} years of work to go!"
end

# retire



# 5.  Greeting a user
def greet
  puts 'What is your name?'
  name = gets.chomp
  greeting = "Hello #{name.capitalize}."
  greeting = "#{greeting} why are we screaming?".upcase if name.end_with?('!')
  puts greeting
end

# greet



# 6.  Odd Numbers
def print_odds
  puts (1..99).step(2).to_a
end

# print_odds



# 7.  Even Numbers
def print_evens
  puts (2..98).step(2).to_a
end

print_evens



# 8.  Sum or Product of Consecutive Integers
def sum_product
  puts '>> Please enter an integer greater than 0:'
  num = gets.to_i
  return puts 'number must be greater than 0' if num <= 0

  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  choice = gets.chomp.downcase
  return puts 'invalid choice' unless %[s p].include?(choice)

  if choice == 's'
    sum = (1..num).reduce(:+)
    puts "The sum of the integers between 1 and #{num} is #{sum}."
  else
    product = (1..num).reduce(:*)
    puts "The product of the integers between 1 and #{num} is #{product}."
  end
end

sum_product



# 9.  String Assignment
# BOB
# BOB



# 10. Mutation
# names with c and s will be upcased
