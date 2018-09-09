# easy2_04.rb
# When will I Retire?

# Build a program that displays when the user will retire and how many years
# she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

YEARS_TO_SECONDS = 3.154e+7

print 'Please enter your age: '
current_age = gets.to_i

print 'Please enter the age at which you would like to retire: '
retire_age = gets.to_i
puts

current_year = Time.now.year
years_left = retire_age - current_age
retire_year = current_year + years_left

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You have only #{years_left} years of work to go!"
