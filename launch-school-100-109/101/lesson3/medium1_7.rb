# medium1_7.rb

# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator,
# A user passes in two numbers, and the calculator will keep computing the
# sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he
# got an error. Something about the limit variable. What's wrong with the code?

# limit = 15

# def fib(first_num, second_num)
#   while second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end

#   sum
# end

# result = fib(0, 1)
# puts "result is #{result}"

# This code will give 'NameError: undefined local variable or method `limit'
# for main:Object'.
# This is because the local variable limit was defined in the main part of the
# program, so it is outside of the scope of the fib method. Methods have their
# own scope for variables, so they can only access local variables that are
# passed into them as arguments when they are called. Therefore, the fib method
# is unable to access the limit variable in this code, which results in the
# error.


# How would you fix this so that it works?

# solution 1:
def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end

  sum
end

result = fib(0, 1)
puts "result is #{result}"


# solution 2:
LIMIT = 15

def fib(first_num, second_num)
  while second_num < LIMIT
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end

  sum
end

result = fib(0, 1)
puts "result is #{result}"


# solution 3:
def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end

  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"
