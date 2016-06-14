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
  num =~ /\d/ && !(num =~ /\D/)
end

def gets_num
  prompt 'Please enter an integer greater than 0:'
  loop do
    num = gets.chomp
    return num.to_i if valid_integer?(num)
    prompt 'Invalid choice. Please choose an integer greater than 0.'
  end
end

def sum_or_product
  prompt "Enter 's' to compute the sum, or 'p' to compute the product:"
  loop do
    choice = gets.chomp.downcase
    return choice if %w(s p).include?(choice)
    prompt "Invalid choice. Please choose: 's' or 'p'."
  end
end

num = gets_num
numbers = (1..num)
choice = sum_or_product

if choice == 's'
  sum = numbers.reduce(:+)
  prompt "The sum of the integers between 1 and #{num} is #{sum}."
else
  product = numbers.reduce(:*)
  prompt "The product of the integers between 1 and #{num} is #{product}."
end
