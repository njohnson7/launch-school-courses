# gets_puts_exercises.rb



# full name greeting
print 'Please enter your first name: '
first = gets.chomp
print 'Please enter your middle name: '
middle = gets.chomp
print 'Please enter your last name: '
last = gets.chomp

puts 'Hello ' + first + ' ' + middle + ' ' + last + '. Nice to meet you.'


# alternate full name greeting
print 'Please enter your first name: '
name = gets.chomp
print 'Please enter your middle name: '
name << ' ' + gets.chomp
print 'Please enter your last name: '
name << ' ' + gets.chomp

puts 'Hello ' + name +'. Nice to meet you.'



# ask for a person's favorite num. add 1 to the num, then suggest the result as a bigger and better favorite num
print "Please enter your favorite number: "
num = gets.to_i + 1
puts "Perhaps #{num} would be a better choice."