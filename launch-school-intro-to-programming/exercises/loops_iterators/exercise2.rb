# exercise2.rb
# Write a while loop that takes input from the user, performs an action, and only stops when
#  the user types "STOP". Each loop can get info from the user.



# Solution 1

input = ""        # assign an empty string to a variable called input

# Prompts user for input and prints out what they input until they enter STOP
while input != "STOP"
  puts "Type STOP to quit"
  input = gets.chomp
  puts "You entered: #{input}"
end


# Solution 2

# Prompts user to enter a number, and calculates the product of that number and 10
# Repeats this process until user enters STOP
while true
  puts "Please enter a number, or type STOP to quit."
  input = gets.chomp
  if input == "STOP"
    puts "Goodbye."
    break
  end
  product = input.to_i * 10
  puts "#{input} * 10 = #{product}"
end


# Solution 3 - similar to above but uses next keyword instead of break

input = ""

while input != "STOP"
  puts "Please enter a number, or type STOP to quit."
  input = gets.chomp
  if input == "STOP"
    puts "Goodbye."
    next
  end
  product = input.to_i * 10
  puts "#{input} * 10 = #{product}"
end


# Book solution

x = ""
while x != "STOP" do
  puts "Hi, How are you feeling?"
  ans = gets.chomp
  puts "Want me to ask you again?"
  x = gets.chomp
end



# VIDEO NOTES:
# can also use the reserved word do after the while <conditional> to create a while loop,
# instead of a newline