# easy2_01.rb
# Build a program that randomly generates and prints Teddy's age. To get the
#  age, you should generate a random number between 20 and 200.

# Example Output:

# Teddy is 69 years old!

puts "Teddy is #{rand(20..200)} years old!"
puts


# Modify this program to ask for a name, and then print the age for that person.
# For an extra challenge, use "Teddy" as the name if no name is entered.

age = rand(20..200)

puts 'Please enter your name:'
name = gets.chomp

puts "#{name == '' ? 'Teddy' : name} is #{age} years old!".capitalize
