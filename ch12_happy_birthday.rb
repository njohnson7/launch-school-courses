# ch12_happy_birthday.rb



puts "What year were you born in?"
year = gets.to_i
puts "What month were you born in (numeric form)?"
month = gets.to_i
puts "What day were you born on?"
day = gets.to_i

age = Time.now - Time.new(year, month, day)

age = age / 60 / 60 / 24 / 365

puts "You are #{age} years old."