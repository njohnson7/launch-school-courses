# exercise3.rb
# Using the same array from exercise 2, use the select method to extract all odd numbers into a new array.



numbers = (1..10).to_a

odd = numbers.select { |n| n.odd? }       # iterates through numbers array using select method to add all odd numbers to new array

p odd       # prints out new array



# BOOK SOLUTION:
odd = numbers.select { |n| n % 2 != 0 }       # selects numbers that when divided by 2 have a remainder not equal to 0 (n mod 2)

p odd


# Alternate syntax:
odd = numbers.select do |n|
  if n % 2 == 1
    true
  else
    false
  end
end

p odd


# Alternate syntax with ternary operator:
odd = numbers.select do |n|
  n.odd? ? true : false       # ternary operator
end

p odd