# exercise2.rb
# What will the following program print to screen?
# What will it return?



def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }


# WRONG ANSWER:
# (this would be the right answer if we were to call the block in the execute method, rather than just entering block.
#  For example:  block.call instead of block)
# This program will print "Hello from inside the execute method!" to the screen, by passing a block that puts that string to the
#  execute method. The execute method takes a block as a parameter and returns the return value of that block.
# The block we are passing the execute method only contains puts and a string, so it will return nil. Since the execute method will
#  return whatever the block will return, it will return nil as well.


# RIGHT ANSWER:
# Since we aren't actually calling the block in the execute method, the above code will not print anything.
# It will return #<Proc:0x000000009938b0@exercise2.rb:11>.


# BOOK ANSWER:
# Nothing is printed to screen because the block is never activated with the .call method. We're not actually executing the block in
#  the above code.
# The method returns a Proc object.