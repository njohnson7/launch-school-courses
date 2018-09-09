# divide.rb
# example - rescue pre-existing errors when writing our code



def divide(number, divisor)
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e       # ZeroDivisionError class = raised when attempting to divide an integer by 0.
    puts e.message                    # here we are rescuing the ZeroDivisionError and saving it to variable e.
                                      # we then have access to the message method that the ZeroDivisionError object has available.
  end
end

puts divide(16, 4)
puts divide(4, 0)       # executes code under rescue block, since divisor is 0
puts divide(14, 7)