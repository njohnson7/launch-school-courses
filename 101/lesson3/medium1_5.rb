# medium1_5.rb

# Alan wrote the following method, which was intended to show all of the factors
# of the input number:

# def factors(number)
#   dividend = number
#   divisors = []
#   begin
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end until dividend == 0
#   divisors
# end

# Alyssa noticed that this will fail if you call this with an input of 0 or a
# negative number and asked Alan to change the loop. How can you change the
# loop construct (instead of using begin/end/until) to make this work?
# Note that we're not looking to find the factors for 0 or negative numbers,
# but we just want to handle it gracefully instead of raising an exception or
# going into an infinite loop.

# solution 1:
def factors(number)
  divisors = []

  (1..number).each do |dividend|
    divisors << number / dividend if number % dividend == 0
  end

  return 'No factors found.' if divisors.empty?
  divisors.sort
end


# solution 2:
def factors(number)
  dividend = number
  divisors = []

  while dividend >= 1
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end

  divisors
end


# Bonus 1:
# What is the purpose of the number % dividend == 0 ?
# number % dividend == 0 uses the modulo operator to check whether the number
# divided by the dividend has a remainder of 0. If it has a remainder of 0, that
# means that the dividend is a factor of the number.


# Bonus 2:
# What is the purpose of the second-to-last line in the method (the divisors
# before the method's end)?
# This line makes the method return the value of the divisors variable, which
# should be an array containing all the numbers of the factors of the argument
# number passed into the factors method. The reason to put it at the end of the
# method is because methods return the value of the last line evaluated, so by
# putting divisors as the last line, the method will always return divisors, as
# long as there is no explicit return statement in the method.
