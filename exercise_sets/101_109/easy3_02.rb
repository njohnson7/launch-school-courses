# easy3_02.rb
# Arithmetic Integer

# Write a program that prompts the user for two positive integers, and then
#  prints the results of the following operations on those two numbers:
#  addition, subtraction, product, quotient, remainder, and power. Do not worry
#  about validating the input.

# Example:

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

OPERATIONS = %w(+ - * / % **)

def prompt(msg)
  puts "=> #{msg}"
end

def valid_int?(num)
  num =~ /^\d+$/ && num.to_i != 0
end

def valid_float?(num)
  num =~ /\d/ && num =~ /^\d*\.?\d*$/
end

def valid_num?(num)
  (valid_int?(num) || valid_float?(num)) && num.to_i != 0
end

def gets_num
  loop do
    num = gets.chomp
    return num.to_f if valid_num?(num)
    prompt 'Invalid choice. Please choose a number greater than 0.'
  end
end

nums = []

%w(first second).each do |order|
  prompt "Please enter the #{order} number:"
  nums << gets_num
end

OPERATIONS.each do |op|
  equation = "#{nums.first} #{op} #{nums.last}"
  result = eval(equation)

  prompt "#{equation} = #{result}"
end
