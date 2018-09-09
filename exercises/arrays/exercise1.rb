# exercise1.rb
# Write a program that checks to see if a number appears in an array



arr = [1, 3, 5, 7, 9, 11]
number = 3

puts arr.include?(number)       # calls include? method on arr array to check if it includes the variable number, and prints
                                #  the result, true or false


# Solution 2 - using a method and user input

# creates a method that checks if an array includes a number, and prints the result
def includes(array, num)
  if array.include?(num)
    puts "The array #{array} includes #{num}."
  else
    puts "The array #{array} does not include #{num}."
  end
end

# prompts user to input a number, and stores it to the variable input
print "Please enter a number: "
input = gets.chomp.to_i

# calls the includes method to see if the user input number is included in an array
includes(arr, input)


# Solution 3 - book solution using each method
#  iterates through array using each method

arr.each do |n|
  if n == input
    puts "#{n} is included in array #{arr}."
  end
end
# allows us to be a little more manual compared to the method below.
# whenever we have a functionality like the above on such a popular class like an array, first you should check array documentation to
#  see if there's already a method that has the same functionality to do whatever it is you want to do


# Solution 4 - book solution using include? method

if arr.include?(input)
  puts "#{input} is included in array #{arr}."
else
  puts "#{input} is not included in array #{arr}."
end