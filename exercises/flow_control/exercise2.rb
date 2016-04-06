# exercise2.rb - caps_method
# write a method that takes a string as an argument
# the method should return the all-caps version of the string, only if the string is
# longer than 10 characters

# Example: change "hello world" to "HELLO WORLD"
    # Hint: look at Ruby's string class on ruby-docs to find helpful methods


# defines a method called all_caps, which converts a string to all capital letters if it is
# greater than 10 characters long, then prints and returns the result
def all_caps(string)
  length = string.length        # calls the length method on a string which assigns the number of
                                # characters in the string as an integer to the variable length
  if length > 10
    puts string.upcase        # calls the upcase method on the string variable, if it is longer than
                              # 10 characters
    string.upcase       # returns output of above (to satisfy requirements of exercise 2 prompt)
  else
    puts string       # otherwise outputs the string unchanged
    string        # returns value of string (to satisfy requirements of exercise 2 prompt)
  end
end

print "Please enter a string: "       # prompts user to input a string
input = gets.chomp        # assigns user input string to the variable input and removes
                          # the trailing newline character by calling the chomp method on the string

all_caps(input)       # calls the all_caps method on the user input string


# Example in book:

puts "\n"
all_caps("hello world")
all_caps("Joe Smith")
all_caps("Joe Robertson")



# VIDEO NOTES:
# goal of this exercise is to study ruby-docs on String class and become familiar w/ available methods