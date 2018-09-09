# exercise3.rb - evaluate_num
# program that takes a number from the user between 0 and 100 and reports back whether
# the number is between 0 and 50, 51 and 100, or above 100



print "Please enter a number: "       # prompts user to enter a number

input = gets.chomp.to_i       # stores user input into input variable and converts it to an integer

# if statement that outputs if the inputted number is between 0 and 50, between 51 and 100, greater
# than 100, or negative
if input >= 0 && input <= 50
  puts "#{input} is between 0 and 50."
elsif input >= 51 && input <= 100
  puts "#{input} is between 51 and 100."
else
  if input > 100
    puts "#{input} is above 100."
  else
    puts "#{input} is a negative number."
  end
end


# solution 2 - same as above but using case statement

puts "\n"

result = case
when input >= 0 && input <= 50
  "#{input} is between 0 and 50."
when input >= 51 && input <= 100
  "#{input} is between 51 and 100."
when input > 100
  "#{input} is above 100."
else
  "#{input} is a negative number."
end

puts result


# solution 3 - book solution

puts "\nPlease enter a number between 0 and 100."
number = gets.chomp.to_i

if number < 0
  puts "You can't enter a negative number!"
elsif number <= 50
  puts "#{number} is between 0 and 50."
elsif number <= 100
  puts "#{number} is between 51 and 100."
else
  puts "#{number} is above 100."
end


# VIDEO NOTES:
# always test boundary conditions first
    # ex: -34 and 123
# then test rest of conditions after