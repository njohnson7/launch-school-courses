# easy2_05.rb
# Greeting a user

# Write a program that will ask for user's name. The program will then greet
#  the user. If the user writes "name!" than the computer yells back to the user.

# Examples:

# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

print 'Please enter your name: '
name = gets.chomp

if name.end_with?('!')
  puts "hello #{name.chop}. why are we screaming?".upcase
else
  puts "Hello #{name}."
end
puts


# Try modifying our solution to use String#chomp! and String#chop!,
#  respectively.

print 'What is your name? '
name = gets
name.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
