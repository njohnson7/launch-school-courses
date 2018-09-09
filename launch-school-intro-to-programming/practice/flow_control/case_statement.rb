# case_statement.rb



a = 5

# sort of a modified version of the if/elsif/else statement we created earlier
case a
when 5
  puts "a is 5"
when 6
  puts "a is 6"
else
  puts "a is neither 5, nor 6"
end


# can also save the result of a case statement into a variable
# refactored version of code above to do that:

a = 5

answer = case a      # can also put as answer = case(a)
  when 5
    "a is 5"
  when 6
    "a is 6"
  else
    "a is neither 5, nor 6"
  end

puts answer


# u don't have to give case an argument
# refactored w/ no case argument

a = 5

answer = case
  when a == 5
    "a is 5"
  when a == 6
    "a is 6"
  else
    "a is neither 5, nor 6"
  end

puts answer


# practice

print "Enter a number: "
input = gets.chomp.to_i

answer2 = case input
  when 5
    "The number is 5"
  when 6
    "The number is 6"
  when 7
    "The number is 7"
  else
    "The number is not 5, 6, or 7"
  end

puts answer2


# practice 2

print "Enter a number: "
input3 = gets.chomp.to_i

answer3 = case
  when input3 < 10
    "The number is less than 10"
  when input3 > 10
    "The number is greater than 10"
  else
    "The number is 10"
  end

puts answer3