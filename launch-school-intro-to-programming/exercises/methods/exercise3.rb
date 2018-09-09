# exercise3.rb
# A program that includes a method called multiply that takes 2 arguments and returns the product of the 2 numbers



# Solution 1

# defines a method called multiply that returns product of 2 numbers
def multiply(num1, num2)
  num1 * num2
end

# prompts user to input 2 numbers and assigns the input to 2 variables, converting the strings to integers
print "Please enter a number: "
input1 = gets.to_i
print "Please enter another number: "
input2 = gets.to_i

# outputs the product of the two numbers inputted by the user with context
puts "#{input1} * #{input2} = #{multiply(input1, input2)}" + "\n\n"


# Solution 2 - using method nesting and an array

# defines a method called input that prompts user to input two numbers, assigns them to two variables, then
# stores those variables in an array and returns the array
def input       # no need to use parameters here
  print "Please enter a number: "
  in1 = gets.to_i
  print "Please enter another number: "
  in2 = gets.to_i
  array = [in1, in2]        # the last line of code declaring the array variable is returned
end

# defines a method called multiply_array that calculates the product of the first two numbers of an array
# and returns the result as a string with context
def multiply_array(array)
  product = array[0] * array[1]
  "#{array[0]} * #{array[1]} = #{product}"
end

# prints out the return value of calling the multiply_array method with the input method as an argument
puts multiply_array(input)
puts "\n"


# Solution 3 - practice solution shown in book

# define method called multiply that takes 2 parameters and returns product of these 2 numbers
def multiply(number1, number2)
  number1 * number2
end

puts multiply(4, 2)       # prints out the result of the multiply method with 4 and 2 as arguments