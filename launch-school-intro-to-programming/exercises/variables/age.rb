# age.rb - Exercise 2


puts "How old are you?"

# Declares local variables for user's age and future ages (to practice different techniques)

age = gets.chomp        # Saves user input to variable age, removing the newline character
age = age.to_i          # Converts user's age string to an integer, so that addition operators can be performed
# OR: age = gets.chomp.to_i
# OR: age = gets.to_i

twenty = age + 20       # Calculates how old user will be in 20 years and assigns it to variable twenty
thirty = age + 30
thirty = thirty.to_s    # Converts user's age in 30 years to a string
hundred = "=> nil"

# Prints how old person will be at various years in the future
# I practiced using different techniques for each expression
puts "In 10 years you will be:\n#{ age + 10 }"

puts "In 20 years you will be:"
puts twenty

puts "In 30 years you will be:\n" + thirty

puts "In 40 years you will be:"
puts thirty.to_i + 10

puts "In 100 years you will be:\n #{hundred}"