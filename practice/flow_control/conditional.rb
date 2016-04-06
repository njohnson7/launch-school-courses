# conditional.rb


puts "Put in a number"
a = gets.chomp.to_i       # using gets to let user input a number, chomp to get rid of new line, and
                          # to_i to turn string into integer
                              # gets always gives us a string

# controls the flow of a program by setting conditionals in an if statement
    # checks, using == operator, to see if input is equal to the num we've defined
if a == 3
  puts "a is 3"
elsif a == 4
  puts "a is 4"
else
  puts "a is neither 3, nor 4"
end


# conditional examples

# example 1
if x == 3
  puts "x is 3"
end

# example 2
if x == 3
  puts "x is 3"
elsif x == 4
  puts "x is 4"
end

# example 3
if x == 3
  puts "x is 3"
else
  puts "x is NOT 3"
end

# example 4: must use "then" keyword when using 1-line syntax
if x == 3 then puts "x is 3" end


# u can also append if condition at the very end
# example 1 can be rewritten like:
puts "x is 3" if x == 3


# ruby also has a reserved word, unless. it acts as opposite as if
# ex:
puts "x is NOT 3" unless x == 3