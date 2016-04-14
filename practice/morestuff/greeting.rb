# greeting.rb
# Example program that raises an exception.
# We can diagnose the cause of the error using the message output from the exception.



def greet(person)
  puts "Hello, " + person
end

greet("John")       # supplies a String as the parameter, so output is what we'd expect
                    # program execution would look like this: main -> greet -> puts -> exit and return to main
greet(1)        # an error occurs and the program execution flow didn't exit back to main, and stayed in the greet method
                # program execution: main -> greet -> put

# raises a TypeError exception:
    # greeting.rb:8:in `+': no implicit conversion of Fixnum into String (TypeError)    # first line is the error type and error msg
    #   from greeting.rb:8:in `greet'
    #   from greeting.rb:13:in `<main>'

# execution works w/i Ruby involving the 'stack'.
# when Ruby invokes a method, the method is added to Ruby's 'stack'.

# Looking at the error, the stack trace first tells us where the error occurred and why: line 8 of greeting.rb, and the error was
#  because the types don't match.
# The error occurred due to the call made in the 'main' context on line 13, whiich contains the line that called the method with
#  incorrect arguments, line 8.