# exercise5.rb
# Why does the following code give us the following error when we run it?



def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# exercise5.rb:6:in `execute': wrong number of arguments (given 0, expected 1) (ArgumentError)
#   from exercise5.rb:10:in `<main>'


# This code gives us the above error because we defined the execute method with a variable called block as the parameter, instead of
#  an actual block. To use an actual block as a parameter, we have to put the ampersand (&) symbol in front of block, like &block.
# The error occurs at line 10 in <main>, which is calling the execute method in line 6. We are calling the execute method with a block
#  as an argument, but the method is defined to take a variable, like a string, as an argument, so the compiler thinks that we didn't
#  call execute with any arguments, when it expected there to be one, giving us an ArgumentError.



# BOOK ANSWER:
# The method parameter, block, is missing the ampersand sign (&) that allows a block to be passed as a parameter.
# Without the ampersand, the parameter is treated just like a regular parameter, instead of as a block.