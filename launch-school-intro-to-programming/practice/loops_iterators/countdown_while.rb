# countdown_while.rb - example of a while loop
    # counts down from any number given by the user and prints to the screen each
    # number as it counts



x = gets.chomp.to_i

while x >= 0        # program evaluates the line x >= 0 to a boolean
  puts x
  x = x - 1
end

puts "Done!"


# can be refactored as follows:

x = gets.chomp.to_i

while x >= 0
  puts x
  x -= 1        # this returns the same result as the above (x = x - 1)
end

puts("Done!")


# since we are using the expression x >= 0 to test if we should execute the loop, the code
# within the loop must modify the var x in some way
    # otherwise x >= 0 will always evaluate to true and cause an infinite loop
        # if u ever find program unresponsive, it may be stuck in an infinite loop