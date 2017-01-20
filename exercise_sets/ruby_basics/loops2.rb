# loops2.rb


# 1. Even or Odd?
count = 1

loop do
  puts "#{count} is #{count.odd? ? 'odd' : 'even'}!"
  count += 1
  break if count > 5
end
puts


# 2. Catch the Number
loop do
  number = rand(100)
  puts number
  break if (0..10).cover?(number)
  # break if number.between?(0, 10)
end
puts


# 3. Conditional Loop
process_the_loop = [true, false].sample
if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end
puts


# 4. Get the Sum
# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   answer == 4 ? (break puts "That's correct!") : (puts 'Wrong answer. Try again!')
# end
# puts


# 5. Insert Numbers
# numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers << input
#   break if numbers.size >= 5
# end
# puts numbers
# puts


# 6. Empty the Array
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  # puts names.shift
  puts names.pop
  break if names.empty?
end
puts


# 7. Stop Counting
5.times do |index|
  puts index
  break if index >= 2
end
puts


# 8. Only Even
number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end
puts


# 9. First to Five
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  # next unless [number_a, number_b].max >= 5
  # break puts '5 was reached!'
  break puts '5 was reached!' if [number_a, number_b].max >= 5
end
puts


# 10. Greeting
def greeting
  puts 'Hello!'
end

number_of_greetings = 2
while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end