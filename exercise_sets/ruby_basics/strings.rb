# strings.rb


# 1. Create a String
a = String.new



# 2. Quote Confusion
puts "It's now 12 o'clock."
puts %(It's "now" '12' o'clock.)
puts



# 3. Ignoring Case
name = 'Roger'
p 'RoGeR'.downcase == name.downcase
p name.downcase == 'DAVE'
p name.casecmp('RoGeR') == 0
p name.casecmp('DAVE') == 0
puts



# 4. Dynamic String
name = 'Elizabeth'
puts "Hello, #{name}!"
puts



# 5. Combining Names
first_name = 'John'
last_name = 'Doe'
full_name = "#{first_name} #{last_name}"
puts full_name
full_name = first_name + ' ' + last_name
puts full_name
full_name = [first_name, last_name].join(' ')
puts full_name
full_name = first_name.sub(/\b\z/, " #{last_name}")
puts full_name
puts



# 6. Tricky Formatting
state = 'tExAs'
state.capitalize!
puts state
puts



# 7. Goodbye, not Hello
greeting = 'Hello!'
greeting.replace('Goodbye!')
puts greeting

greeting = 'Hello!'
greeting.sub!('Hello', 'Goodbye')
puts greeting
puts



# 8. Print the Alphabet
alphabet = 'abcdefghijklmnopqrstuvwxyz'
puts alphabet.chars
puts



# 9. Pluralize
words = 'car human elephant airplane'
words.split.each { |word| puts "#{word}s"}
puts words.gsub(/([a-z]+) ?/, "\\1s\n")
puts



# 10. Are You There?
colors = 'blue pink yellow orange'
puts colors.include?('yellow')
puts colors.include?('purple')
puts

colors = 'blue boredom yellow'
puts colors.include?('red')
puts

colors = 'blue pink yellow orange'
puts !!(colors[/\byellow\b/])
puts !!(colors =~ /\bpurple\b/)