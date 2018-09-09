# conditional_loop.rb - prints all even numbers from 0 to 10



i = 0
loop do
  i += 2
  puts i
  if i == 10
    break       # this will cause execution to exit the loop
  end
end
    # => nil
# break was not executed during the first 4 iterations through the loop,
# but on the 5th iteration, the if statement evaluated to true, and so the code within
# the if statement was executed, which is just break, and execution exited the loop