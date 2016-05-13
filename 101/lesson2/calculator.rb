# calculator.rb
# Build a command line calculator program that does the following:
#   - asks for 2 numbers
#   - asks for the type of operation to perform: add, subtract, multiply, or divide
#   - displays the result
# - Use gets to retrieve user input
# - Use puts to display output

# psuedo code:
# ask the user for 2 nums
# ask the user for an operation to perform
# perform the operation on the 2 nums
# output the result


def prompt(message)
  puts "=> #{message}"
end

prompt 'Welcome to Calculator!'

prompt 'Please enter a number.'
num1 = gets.to_f
prompt 'Please enter another number.'
num2 = gets.to_f


prompt "Would you like to 'add', 'subtract', 'multiply', or 'divide' these 2 numbers?"
operation = gets.chomp.downcase

result = case operation
         when 'add' then num1 + num2
         when 'subtract' then num1 - num2
         when 'multiply' then num1 * num2
         when 'divide' then num1 / num2
         else 'Invalid choice'
         end

prompt "The result is: #{result}"