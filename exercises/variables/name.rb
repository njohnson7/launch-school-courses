# name.rb



# Exercise 1 and 4

puts "Please type in your first name: "     # Prints prompt asking user to type in their first name

name = gets.chomp                      # Creates a variable called name for the user to input a string
                                      # and removes the carriage return character '\n' at the end of the string


puts "Now please type in your last name: "  # name.rb continued again - Exercise 4
lastname = gets.chomp
name = name + " " + lastname                # Concatenates first and last names, along with a space character,
                                            # and saves resulting string to name variable


puts "\nHello #{name}!"               # Prints a string with a greeting, followed by the string input from user


# Alternate output method using string concatenation:
puts "\nWelcome " + name + "!\n"



# name.rb continued - Exercise 3

# 1st technique - use times method on a do/end statement to output name variable 10 times
puts "\n\nExercise 3\n\n" + "1st technique:\n"
10.times do
  puts name
end

# 2nd technique - use while loop to do the same as above, by incrementally adding to an integer 10
puts "\n2nd technique:\n"
a = 1
while a <= 10
  puts name
  a += 1
end

# 3rd technique - using string concatenation and interpolation
name = name + "\n"
puts "\n3rd technique:\n"+ name + name + name + name + name + "#{name}#{name}#{name}#{name}#{name}"

# 4th technique - using an array
array = [ name, name, name, name, name, name, name, name, name, name ]
puts "\n4th technique:\n"
puts array

# 5th technique - using a hash
hash = { a: name, b: name, c: name, d: name, e: name, f: name, g: name, h: name, j: name, k: name }
puts "\n5th technique:\n"
puts hash[:a] + hash[:b] + hash[:c] + hash[:d] + hash[:e] + hash[:f] + hash[:g] + hash[:h] + hash[:j] + hash[:k]