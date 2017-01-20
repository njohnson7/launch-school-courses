# loops1.rb


# 1. Runaway Loop
loop do
  puts 'Just keep printing...'
  break
end
puts


# 2. Loopception
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end

  break
end

puts 'This is outside all loops.'
puts


# 3. Control the Loop
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break if iterations >= 5
  iterations += 1
end
puts


# 4. Loop on Command
# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break if answer == 'yes'
# end
# puts


# 5. Say Hello
say_hello = true
idx = 0

while say_hello
  puts 'Hello!'
  idx += 1
  say_hello = false if idx >= 5
end
puts


# 6. Print While
numbers = []

while numbers.size < 5
  numbers << rand(100)
end

puts numbers
puts


# 7. Count Up
count = 1

until count > 10
  puts count
  count += 1
end
puts


# 8. Print Until
numbers = [7, 9, 13, 25, 18]

puts numbers.shift until numbers.empty?
puts


# 9. That's Odd
for i in (1..100).step(2)
  puts i
end
puts


# 10. Greet Your Friends
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for name in friends
  puts "Hello, #{name}!"
end
