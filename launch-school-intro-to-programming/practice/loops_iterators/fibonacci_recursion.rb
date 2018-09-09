# fibonacci_recursion.rb
# Uses a method that uses recursion to calculate the nth number in the fibonacci sequence -
    # A sequence of numbers in which each number is the sum of the previous 2 numbers in
    #  the sequence



def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

input = gets.chomp.to_i

puts fibonacci(input)