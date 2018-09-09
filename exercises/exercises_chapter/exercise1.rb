# exercise1.rb
# Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.



numbers = (1..10).to_a        # creates an array containing the range of numbers from 1 to 10

numbers.each { |n| puts n }       # iterates over numbers array, printing out each number