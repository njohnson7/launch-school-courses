# mortgage_calculator.rb

require 'pry'

# prepends '=> ' to a string for use as a prompt
def prompt(msg)
  puts "=> #{msg}"
end

# checks if name is a valid name
def valid_name?(name)
  return true if name =~ /[a-zA-Z]/
  false
end

# checks if a number string is a valid integer
def valid_int?(num)
  return false if num.start_with?('-') # guard for negative numbers
  Integer(num) rescue false
end

# checks if a number string is a valid float
def valid_float?(num)
  num =~ /\d/ && num =~ /^\d*\.?\d*$/
end

# checks if a number string is a valid dollar amount
def valid_dollars?(num)
  if valid_int?(num)
    return true
  elsif valid_float?(num)
    # returns true only if there are either 0 or 2 digits after the decimal
    return true if num.split('.').last.length == 2 || num.split('.').length == 1
  end
  false
end

# checks if a number string is a valid APR
def valid_apr?(apr)
  if valid_int?(apr) || valid_float?(apr)
    apr_ary = apr.split('.')
    if apr_ary.first.length > 2
      return false
    else
      return true
    end
  end
  false
end

# adds commas to a number
def add_commas(num)
  ary = num.split('')
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

# converts a number string to a dollar formatted string
def num_to_dollars(num)
  num_str = num.to_f.to_s
  num_ary = num_str.split('.')
  if num_ary.last.length == 1 # adds a zero if there is only 1 number in after the decimal
    num_ary.last << '0'
  elsif num_ary.last.length > 2 # removes any numbers longer than 2 places after decimal
    num_ary[1] = num_ary[1][0] + num_ary[1][1]
  end

  num_ary[0] = add_commas(num_ary.first) if num_ary.first.length > 3 # adds commas to numbers before decimal

  num_str = num_ary.join('.')
  num_str.prepend('$') # adds dollar sign before number
end

# capitalizes a name string
def capitalize_name(name)
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
name = capitalize_name(name)
prompt "Hello #{name}!"

# mortgage/loan calculator main loop
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
    prompt 'Invalid APR. Please try again. (ex: 33.42 for 33.42%)'
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
  end

  prompt 'Would you like to calculate another loan? (Type "y" for "yes")'
  answer = gets.chomp.downcase
  break unless answer == 'y'
end

prompt "Thank you for using Mortgage & Car Loan Calculator, #{name}! Goodbye."

# Fix? -- if 0 APR, results in monthly_payment = NaN, which gives wrong results
