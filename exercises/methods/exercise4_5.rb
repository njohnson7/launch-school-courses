# exercise4_5.rb



# Exercise 4

def scream(words)         # defines a method called scream with the parameter words
  words = words + "!!!!"  # concatenates "!!!!" to the words string
                          # if you end the method here, it will return exclamation points after
                          # the words string
  return        # returns nil
                # if you end the method here, it will return nil
                # because you're using the return keyword and a blank space, which explicitly tells it
                # to return nil

  puts words        # outputs words variable and returns nil
                    # if you remove the return keyword above, then the line
                    # below will print out "Yippeee!!!!", but the method will still return nil, as puts
                    # has no return value
end

scream("Yippeee")       # if you leave everything as it is, then nothing will be printed out because
                        # the scream method returns a nil value

# VIDEO NOTES:
# when you have a return keyword in the middle of a method, the code after the return is never executed
# it's not a good way to write code


# Exercise 5 - fix code above so that it does print words on the screen

# same as above, except removed the return keyword
def scream(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee")

# it prints out "Yippeee!!!!" now but it still returns nil, because methods always returns the
# evaluated result of the last line of the expression that is executed, which is puts in this case,
# and puts always returns nil
# the return keyword has been removed so it will now execute the puts words line

# you could also leave the returns keyword in, but move it to the last line of the method to
# achieve the same result:
def scream(words)
  words = words + "!!!!"
  puts words
  return
end

scream("Yippeee")       # since the return keyword is now on the last line, it will still return nil, but
                        # it will successfully execute all the code above the return keyword


# VIDEO NOTES

# modify code so that it returns something:
def scream(words)
  words = words + "!!!!"
  puts words
  "hi there"        # now the method returns the string "hi there" instead of nil
end

scream("Yippeee")       # still prints "Yippeee!", but now returns "hi there"

# so in ruby methods, the last thing in the method is the return value, regardless of what happens in the method,
# EXCEPT for the return keyword