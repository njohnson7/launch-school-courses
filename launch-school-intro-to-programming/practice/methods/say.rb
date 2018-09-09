# say.rb

# ORIGINAL PROGRAM:
# puts "hello"
# puts "hi"
# puts "how are you"
# puts "I'm fine"


# say.rb REFACTORED:

# def say(words)
#   puts words + '.'
# end

# say("hello")
# say("hi")
# say("how are you")
# say("I'm fine")


# say.rb REFACTORED AGAIN:
def say (words='hello')     # provides default parameter
  puts words + '.'
end

say()                       # method called w/o any arguments, so puts 'hello.'
say("hi")
say("how are you")
say("I'm fine")