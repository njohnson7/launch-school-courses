# methods_practice.rb



print "what is ur first name: "
first = gets.chomp
print "what is ur middle name: "
middle = gets.chomp
print "what is ur last name: "
last = gets.chomp

name_length = first.length + middle.length + last.length

puts "Did you know there are #{name_length} letters in your name, #{first} #{middle} #{last}?"


# alternate method:
print "what is ur first name: "
name = gets.chomp
print "what is ur middle name: "
name << " " + gets.chomp
print "what is ur last name: "
name << " " + gets.chomp

name_length = name.delete(" ").length

puts "Did you know there are #{name_length} letters in your name, #{name}?"