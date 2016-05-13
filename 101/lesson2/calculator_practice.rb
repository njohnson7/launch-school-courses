# calculator_practice.rb

# Build a command line calculator program that does the following:
#   - asks for 2 numbers
#   - asks for the type of operation to perform: add, subtract, multiply, or divide
#   - displays the result
# - Use gets to retrieve user input
# - Use puts to display output


def prompt(message)       # adds '=>' to beginning of message
  puts "=> #{message}"
end

def valid_commas?(num_ary)        # checks if number and positioning of commas is valid
  return false if num_ary.first == ',' || num_ary.last == ','
  if num_ary.count('.') == 1
    removed_decimal = num_ary.join.split('.')
    removed_decimal.delete_at(1)
    num_ary = removed_decimal.join.split('')
  end
  commas = num_ary.count(',')
  no_comma_ary = num_ary.map { |char| char }
  no_comma_ary.delete(',')
  digits = no_comma_ary.length
  return false unless digits / 3.0 > commas && digits / 3.0 <= commas + 1

  num_ary.each_with_index do |char, idx|
    first = num_ary[idx + 1]
    second = num_ary[idx + 2]
    third = num_ary[idx + 3]
    fourth = num_ary[idx + 4]

    if char == ','
      return false if first == ',' || second == ',' || third == ','
      return false if first.nil? || second.nil? || third.nil?
      return false if !first.nil? && !second.nil? && !third.nil? && fourth != ',' unless fourth.nil?
    end
  end
  true
end

def valid_num?(num_str)       # determines if a number in string format is a valid number
  return false if num_str.nil? || num_str.empty?        # checks for empty string
  num_ary = num_str.split('')
  num_ary_copy = num_ary.map { |char| char }
  if num_ary.include?('.')        # checks decimals
    return false if num_ary.count('.') > 1 || num_ary.length == 1
    num_ary.delete('.')
  end
  if num_ary.include?('-')        # checks negative signs
    return false if num_ary.count('-') > 1 || num_ary.first != '-' || num_ary.length == 1
    num_ary.delete('-')
  end
  if num_ary_copy.include?(',')        # checks commas
    return false unless valid_commas?(num_ary_copy)
    num_ary.delete(',')
  end
  num_str = num_ary.join
  return false if num_str =~ /\D/       # checks to see if there are any invalid characters
  true
end

def gets_valid_num        # prompts the user to enter a valid number, repeating until the number is valid
  loop do
    prompt 'Invalid number. Please try again.'
    num = gets.chomp
    return num if valid_num?(num)
  end
end

def gets_numbers        # gets 2 numbers from a user
  prompt 'Please enter a number.'
  num1 = gets.chomp
  num1 = gets_valid_num unless valid_num?(num1)
  prompt 'Please enter another number.'
  num2 = gets.chomp
  num2 = gets_valid_num unless valid_num?(num2)
  [num1.delete(',').to_f, num2.delete(',').to_f]        # removes commas
end

def print_calculation(numbers, operation)       # performs an operation on 2 numbers and outputs the result
  num1 = numbers.first
  num2 = numbers.last
  case operation
  when 'add'
    operator = '+'
    result = num1 + num2
  when 'subtract'
    operator = '-'
    result = num1 - num2
  when 'multiply'
    operator = '*'
    result = num1 * num2
  when 'divide'
    operator = '/'
    result = if num2 == 0
               "<ERROR: You can't divide by 0!>"
             else
               num1 / num2
             end
  end
  result_ary = result.to_i.to_s.split('')       # adds commas to result, while preserving values after decimal
  if result_ary.length > 3
    split_decimal = result.to_s.split('.')
    decimals = split_decimal[1]
    result = add_commas(result_ary) + '.' + decimals
  end
  prompt "#{num1} #{operator} #{num2} = #{result}"
end

def add_commas(ary)
  ary_commas = []
  ary_copy = ary.map { |n| n }
  counter = 1
  ary.each do
    ary_commas << ary_copy.pop
    ary_commas << ',' if counter % 3 == 0
    counter += 1
  end
  ary_commas.reverse!
  ary_commas.delete_at(0) if ary_commas.first == ','
  ary_commas.delete_at(-1) if ary_commas.last == ','
  ary_commas.join
end


prompt 'Welcome to Calculator!'
numbers = gets_numbers

loop do
  prompt "Would you like to 'add', 'subtract', 'multiply', 'divide', or 'exit'?"
  choice = gets.chomp.downcase
  case choice
  when 'exit' then break
  when 'add', 'subtract', 'multiply', 'divide'
    print_calculation(numbers, choice)
    numbers = gets_numbers
  else
    prompt 'Invalid command. Please try again.'
  end
end

prompt 'Goodbye!'