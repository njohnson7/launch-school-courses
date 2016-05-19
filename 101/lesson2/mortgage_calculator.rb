# mortgage_calculator.rb
# frozen_string_literal: true

def prompt(msg)
  puts "=> #{msg}"
end

def valid_name?(name)
  name =~ /[a-zA-Z]/
end

def valid_int?(num)
  num =~ /^\d+$/
end

def valid_float?(num)
  num =~ /\d/ && num =~ /^\d*\.?\d*$/
end

def valid_num?(num)
  valid_int?(num) || valid_float?(num)
end

def valid_dollars?(num)
  valid_num?(num) && (num.split('.').last.length == 2 || num.split('.').length == 1)
end

def valid_apr?(apr)
  valid_num?(apr) && apr.to_f >= 0 && apr.to_f <= 100
end

def add_commas(num)
  ary = num.split('')
  ary_commas = []
  counter = 1

  ary.length.times do
    ary_commas << ary.pop
    ary_commas << ',' if counter % 3 == 0
    counter += 1
  end

  ary_commas.pop if ary_commas.last == ','
  ary_commas.reverse.join
end

def num_to_dollars(num)
  num.delete!('.') if num.end_with?('.') # guard for number strings ending in '.' so that format method will work
  num_str = format('%02.2f', num)

  # adds commas to numbers before decimal
  num_ary = num_str.split('.')
  num_ary[0] = add_commas(num_ary.first)
  num_str = num_ary.join('.')

  num_str.prepend('$')
end

def capitalize_each(name)
  name.split(' ').map(&:capitalize).join(' ')
end

prompt 'Welcome to Mortgage & Car Loan Calculator!'
prompt '------------------------------------------'
puts

# gets user's name
prompt 'Please enter your name:'
name = ''
loop do
  name = gets.chomp
  break if valid_name?(name)
  prompt 'Invalid name. Please try again.'
end
name = capitalize_each(name)
prompt "Hello #{name}!"

# main loop
loop do
  # gets loan amount from user
  prompt 'Please enter your loan amount. (ex: 43032.79)'
  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    break if valid_dollars?(loan_amount)
    prompt 'Invalid amount. Please try again. (ex: 25000.00)'
  end
  loan_amount_str = num_to_dollars(loan_amount)
  loan_amount = loan_amount.to_f

  # gets APR from user
  prompt 'Please enter your Annual Percentage Rate (APR). (ex: 5 for 5% or 12.5 for 12.5%)'
  apr = ''
  loop do
    apr = gets.chomp
    break if valid_apr?(apr)
    prompt 'Invalid APR. Please try again. (Must be a number between 0 and 100)'
  end
  apr_str = "#{apr}%"
  apr = apr.to_f

  # gets loan duration from user
  prompt 'Please enter your loan duration in years. (ex: 3)'
  duration_years = ''
  loop do
    duration_years = gets.chomp
    break if valid_int?(duration_years)
    prompt 'Invalid response. Please enter an integer. (ex: 5)'
  end
  duration_years = duration_years.to_i

  # calculates monthly interest rate and duration of loan in months
  monthly_rate = apr / 100.0 / 12
  duration_months = duration_years * 12

  # calculates monthly payment
  monthly_payment = loan_amount * (monthly_rate * (1 + monthly_rate)**duration_months) /
                    ((1 + monthly_rate)**duration_months - 1)
  monthly_payment_str = num_to_dollars(monthly_payment.to_s)

  prompt "Your fixed monthly payment to fully amortize your loan of #{loan_amount_str} at an APR of #{apr_str}" \
         " over a term of #{duration_years} years is: #{monthly_payment_str}."
  puts

  prompt 'Would you like to calculate the remaining loan balance of your fixed payment loan? (Type "y" for "yes")'
  answer = gets.chomp.downcase

  # remaining balance loop
  if answer == 'y'
    # gets monthly payment duration in months from user
    prompt "How many months have you been making your payment of #{monthly_payment_str}? (ex: 12)"
    months_paid = ''
    loop do
      months_paid = gets.chomp
      break if valid_int?(months_paid)
      prompt 'Invalid response. Please enter an integer. (ex: 24)'
    end
    months_paid = months_paid.to_i

    # calculates remaining balance
    remaining_balance = loan_amount * ((1 + monthly_rate)**duration_months - (1 + monthly_rate)**months_paid) /
                        ((1 + monthly_rate)**duration_months - 1)
    remaining_balance_str = num_to_dollars(remaining_balance.to_s)
    remaining_months = duration_months - months_paid

    prompt "Your remaining loan balance after having paid #{monthly_payment_str} for #{months_paid} months is:" \
           " #{remaining_balance_str}.\n" \
           "   Your loan will be paid off in #{remaining_months} months if you continue making a payment" \
           " of #{monthly_payment_str} every month."
    puts
  end

  prompt 'Would you like to calculate another loan? (Type "y" for "yes")'
  answer = gets.chomp.downcase
  break unless answer == 'y'
end

puts
prompt "Thank you for using Mortgage & Car Loan Calculator, #{name}! Goodbye."

# Fix? -- if 0 APR, results in monthly_payment = NaN, which gives wrong results
