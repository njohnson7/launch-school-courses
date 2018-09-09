# exercise6.rb




# def equal_to_four(x)
#   if x == 4
#     puts "yup"
#   else
#     puts "nope"
# end

# equal_to_four(5)


# The following error message occurs if you try to run the above code:
# exercise6.rb:13: syntax error, unexpected end-of-input, expecting keyword_end

# This message is telling us that our code has a syntax error involving an
# unexpected end of input. The computer was expecting the keyword end.

# This is because we forgot to add the end keyword after the if/else block. There is
# only the end keyword for the method block, as evidenced by the indentation.
# If we add another end keyword after the else statement, we can resolve this error.



# Example:

def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  end
end

equal_to_four(5)        # prints out "nope" because 5 is not equal to 4



# VIDEO NOTES:

# The interpreter matches the the single end keyword with the if..else statement, and
# was expecting there to be another end keyword to, close off the equal_to_four method,
# but it was not found, resulting in the error message.

# in a real world app, there might be a lot more stuff after the error message