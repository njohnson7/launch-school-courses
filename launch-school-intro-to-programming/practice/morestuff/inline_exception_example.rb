# inline_exception_example.rb
# rescue reserved word can also be used in-line



zero = 0
puts "Before each call"
zero.each { |element| puts element } rescue puts "Can't do that!"       # outputs "Can't do that!" because each method can't be
                                                                        #  called on an integer
# without the rescue block, the second puts method below will not execute because the program will exit when it runs into the error
puts "After each call\n\n"


# if we gave this same code the proper var, rescue block never gets executed:

zero = ["skips", "rescue", "block", "now"]
puts "Before each call"
zero.each { |element| puts element } rescue puts "Can't do that!"
puts "After each call"