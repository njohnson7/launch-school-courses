# easy2_08.rb
# Sum or Product of Consecutive Integers

# Write a program that asks the user to enter an integer greater than 0, then
#  asks if the user wants to determine the sum or product of all numbers between
#  1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

def prompt(msg)
  puts "=> #{msg}"
end

def valid_integer?(num)
  num[/\d/] && !(num[/\A0|\D/])
end

def choose_num
  prompt 'Please enter an integer greater than 0:'
  loop do
    num = gets.chomp
    return num.to_i if valid_integer?(num)
    prompt 'Invalid choice. Please choose an integer greater than 0.'
  end
end

def choose_operation
  prompt "Enter 's' to compute the sum, or 'p' to compute the product:"
  loop do
    operation = gets.chomp.downcase
    return operation if %w[s p].include?(operation)
    prompt "Invalid choice. Please choose: 's' or 'p'."
  end
end

def calculate_sum(num)
  [(1..num).reduce(:+), :sum]
end

def calculate_product(num)
  [(1..num).reduce(:*), :product]
end

def display_result(num, result, type)
  prompt "The #{type} of the integers between 1 and #{num} is #{result}."
end

def main
  num = choose_num
  operation = choose_operation
  result, type = operation == 's' ? calculate_sum(num) : calculate_product(num)
  display_result(num, result, type)
end

main