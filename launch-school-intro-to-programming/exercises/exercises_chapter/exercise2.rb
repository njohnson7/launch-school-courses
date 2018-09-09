# exercise2.rb
# Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out values greater than 5.



numbers = (1..10).to_a

numbers.each { |n| puts n if n > 5 }        # iterates over numbers array, printing out any number greater than 5