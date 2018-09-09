# easy3_01.rb
# Searching 101

# Write a program that solicits 6 numbers from the user, then prints a message
#  that describes whether or not the 6th number appears amongs the first 5
#  numbers.

# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

NUMBER_ORDER = %w(1st 2nd 3rd 4th 5th last)

def valid_integer?(num)
  num =~ /\d/ && !(num =~ /\D/)
end

def gets_num
  loop do
    num = gets.chomp
    return num if valid_integer?(num)
    puts '=> Invalid choice. Please choose an integer.'
  end
end

numbers = []

NUMBER_ORDER.each do |order|
  print "=> Enter the #{order} number: "
  num = gets_num.to_i
  numbers << num
end

last = numbers.pop

puts "The number #{last}" \
     " #{numbers.include?(last) ? 'appears' : 'does not appear'}" \
     " in #{numbers.inspect}."
