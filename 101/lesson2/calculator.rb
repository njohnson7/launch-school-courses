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

LANGUAGE = 'en'

require 'yaml'
MSGS = YAML.load_file('calc_msgs.yml')

def msgs(msg, lang='en')
  MSGS[lang][msg]
end

def prompt(msg)
  puts "=> #{msg}"
end

def valid_num?(num)
  num.to_i != 0
end

def op_to_msg(op)
  msg = case op
        when 'add' then 'Adding'
        when 'subtract' then 'Subtracting'
        when 'multiply' then 'Multiplying'
        when 'divide' then 'Dividing'
        end
  x = 'a random line of code'
  msg
end

prompt msgs('welcome', LANGUAGE)
name = ''
loop do
  name = gets.chomp

  break unless name.empty?
  prompt 'valid_name'
end

prompt msgs('hi', LANGUAGE) + name.capitalize + '!'

loop do # main loop
  num1 = ''
  loop do
    prompt msgs('enter_num', LANGUAGE)
    num1 = gets.to_f
    break if valid_num?(num1)
    prompt msgs('invalid_num', LANGUAGE)
  end

  num2 = ''
  loop do
    prompt msgs('enter_another_num', LANGUAGE)
    num2 = gets.to_f
    break if valid_num?(num2)
    prompt msgs('invalid_num', LANGUAGE)
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    - 'add'
    - 'subtract'
    - 'multiply'
    - 'divide'
  MSG

  prompt operator_prompt

  operation = ''
  loop do
    operation = gets.chomp.downcase

    break if %w(add subtract multiply divide).include?(operation)
    prompt msgs('invalid_op', LANGUAGE)
  end

  prompt "#{op_to_msg(operation)} the two numbers..."

  result = case operation
           when 'add' then num1 + num2
           when 'subtract' then num1 - num2
           when 'multiply' then num1 * num2
           when 'divide' then num1 / num2
           end

  prompt msgs('result', LANGUAGE) + result.to_s

  prompt msgs('another', LANGUAGE)
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt msgs('thanks', LANGUAGE)
