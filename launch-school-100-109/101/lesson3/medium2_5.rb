# medium2_5.rb
# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# This code will output 34, because even though we called the mess_with_it
# method passing in the answer variable as a parameter, the mess_with_it method
# does not mutate the caller, it just reassigns the caller, so it just returns
# some_number + 8, leaving the parameter passed in unmodified. Therefore,
# new_answer = 50, but answer still = 42, so 42 - 8 is 34, which gets printed
# out by the p method.
