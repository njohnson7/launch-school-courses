# methods_as_arguments.rb



# examples of how methods are called
    # define add and subtract methods and call them

def add(a, b)       # add method takes the parameters a and b (assumed they are integers)
  a + b       # last line of method is implicitly returned
end

def subtract(a, b)
  a - b       # can also use explicit return to be more specific
end


# calling above methods by passing integer values

add(20, 45)       # => 65

subtract(80, 10)  # => 70


# Ruby actually allows us to pass method calls as an argument to other methods
    # so we can pass add(20, 45) and subtract(80, 10) as arguments to another method
        # b/c these method calls return integer values
            # the returned value is what is being passed as arguments
# Ex: defining a multiply method

def multiply(num1, num2)
  num1 * num2
end

# pass add(20, 45) and subtract(80, 10) as arguments to multiply
multiply(add(20, 45), subtract(80, 10))       # => 4550

add(subtract(80, 10), multiply(subtract(20, 6), add(30, 5)))        # => 560
    # passing add 2 arguments:
        # subtract(80, 10)
            # => 70
        # multiply(subtract(20, 6), add(30, 5))
            # passing multiply 2 arguments:
                # subtract(20, 6)
                    # => 14
                # add(30, 5)
                    # => 35
            # multiply (14, 35)
                # => 490
    # add (70, 490)
        # => 560

# Above is called NESTED METHODS
    # very important to use parantheses to avoid any confusion when using nested methods


# Method calls always return a value, and we can pass that method call as an argument to
# another method based on the returned value
    # so it's vital to know what our defined methods are returning, since that is
    # what is actually being passed as arguments to other methods