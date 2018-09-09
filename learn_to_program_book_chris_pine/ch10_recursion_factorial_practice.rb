# ch10_recursion_factorial_practice.rb



def factorial num
  if num < 0
    return 'You can\'t take the factorial of a negative number!'
  elsif num <= 1
    1
  else
    num * factorial(num - 1)
  end
end

puts factorial(3)
puts factorial(30)
puts factorial(1)
puts factorial(-20)
puts factorial(5)