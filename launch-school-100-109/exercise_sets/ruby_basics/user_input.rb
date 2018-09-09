# user_input.rb


# 1. Repeat After Me
def repeater
  puts '>> Type anything you want:'
  input = gets.chomp
  puts input
end

# repeater



# 2. Your Age in Months
def age_in_months
  puts '>> What is your age in years?'
  age = gets.to_i
  months = age * 12
  puts "You are #{months} months old."
end

# age_in_months



# 3. Print Something (Part 1)
def print_something
  puts '>> Do you want me to print something? (y/n)'
  answer = gets.chomp.downcase
  puts 'something' if answer == 'y'
end

# print_something



# 4. Print Something (Part 2)
def print_something
  answer = nil
  loop do
    puts '>> Do you want me to print something? (y/n)'
    answer = gets.chomp.downcase
    break if %w(y n).include?(answer)
    puts '>> Invalid input! Please enter y or n'
  end
  puts 'something' if answer == 'y'
end

# print_something



# 5. Launch School Printer (Part 1)

def launch_school_printer
  num = nil
  loop do
    puts ">> How many output lines do you want? Enter a number >= 3:"
    num = gets.to_i
    break if num >= 3
    puts ">> That's not enough lines."
  end
  num.times { puts "Launch School is the best!" }
end

# launch_school_printer



# 6. Passwords
# PASSWORD = 'SecreT'.freeze

def password
  loop do
    puts '>> Please enter your password:'
    input = gets.chomp
    break puts 'Welcome!' if input == PASSWORD
    puts '>> Invalid password!'
  end
end

# password



# 7. User Name and Password
USER_NAME = 'admin'.freeze
PASSWORD = 'SecreT'.freeze

def user_name_and_password
  loop do
    puts '>> Please enter your user name:'
    user_name = gets.chomp
    puts '>> Please enter your password:'
    password = gets.chomp
    break puts 'Welcome!' if [user_name, password] == [USER_NAME, PASSWORD]
    puts '>> Authorization failed!'
  end
end

# user_name_and_password



# 8. Dividing Numbers
NON_INTEGER_MSG = '>> Invalid input. Only integers are allowed.'.freeze

def division
  num, denom = numerator, denominator
  result = num / denom
  puts ">> #{num} / #{denom} is #{result}"
end

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def numerator
  loop do
    puts '>> Please enter the numerator:'
    num = gets.chomp
    return num.to_i if valid_number?(num)
    puts NON_INTEGER_MSG
  end
end

def denominator
  loop do
    puts '>> Please enter the denominator:'
    denom = gets.chomp
    if !(valid_number?(denom))
      puts NON_INTEGER_MSG
    elsif denom.to_i == 0
      puts '>> Invalid input. A denominator of 0 is not allowed.'
    else
      return denom.to_i
    end
  end
end

# division



# 9. Launch School Printer (Part 2)
def launch_school_printer
  loop do
    answer = user_input
    break unless answer
    answer.times { puts "Launch School is the best!" }
  end
end

def user_input
  loop do
    puts ">> How many output lines do you want? Enter a number >= 3: (Q to quit):"
    answer = gets.chomp.downcase
    if answer == 'q'
      return nil
    elsif answer.to_i >= 3
      return answer.to_i
    else
      puts ">> That's not a valid choice. Please enter a number >= 3 or 'Q' to quit:"
    end
  end
end

# launch_school_printer



# 10. Opposites Attract
def opposites
  loop do
    num1, num2 = user_integer, user_integer
    if negative_positive?(num1, num2)
      sum = num1 + num2
      break puts "#{num1} + #{num2} = #{sum}"
    end
    puts '>> Sorry. One integer must be positive, one must be negative.'
    puts '>> Please start over.'
  end
end

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def user_integer
  loop do
    puts '>> Please enter a positive or negative integer:'
    integer = gets.chomp
    return integer.to_i if valid_number?(integer)
    puts '>> Invalid input. Only non-zero integers are allowed.'
  end
end

def negative_positive?(num1, num2)
  num1.negative? ^ num2.negative?
end

opposites