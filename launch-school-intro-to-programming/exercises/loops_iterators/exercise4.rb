# exercise4.rb
# Method that counts down to 0 using recursion




# Creates a method called countdown that will count down to 0 from any positive number
#  using recursion
def countdown(number)
  if number < 0       # If number is negative, stops executing code and prints a warning
    puts "You can't enter a negative number!"
  elsif number == 0       # if number is 0, prints 0 and stops counting down
    puts number
  else                # prints out the current number and then calls countdown method
                      #  recursively on the next number down
    puts number
    countdown(number - 1)
  end
end

# Prompts user for a number, then input to number variable, then calls countdown method on it
print "Please enter a positive number: "
number = gets.chomp.to_i
countdown(number)


# Book solution

def count_to_zero(number)
  if number <= 0        # stop condition is when this number = 0
                        # once it reaches stop condition it will stop calling method recursively
    puts number
  else                # else condition is the recursive condition
    puts number
    count_to_zero(number - 1)       # recursively call this method again, and decrement it
end

count_to_zero(10)
count_to_zero(20)
count_to_zero(-3)



# VIDEO NOTES:
# when we rhink about recursion, think about stop condition - under what condition do we stop
# from calling this method again
# recursion's all about repeatedly calling this method w/ a different argument
# stop condition