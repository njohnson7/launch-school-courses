# return.rb



def add_three(number)
  number + 3
end

returned_value = add_three(4)   # saves returned value of add_three method in a var called returned_value
puts returned_value             # prints returned_value to output to see what it has inside it
                                # @> 7



# Ruby methods ALwAYS return the evaluated result of the last line of the expression unless an
# explicit return comes before it

# return keyword = used to explicitly return a value

def add_three(number)
  return number + 3
end

returned_value = add_three(4)       # still => 7
puts returned_value



# example test

def add_three(number)
  return number + 3                 # returns this line
  number + 4                        # skips this line
end

returned_value = add_three(4)       # still => 7 instead of 8, b/c u told it to return number + 4
puts returned_value



# return reserved word is not required to return s/t from a method

def just_assignment(number)
  foo = number + 3
end

puts just_assignment(2)       # @> 5 b/c the assignment expression evaluates to 5




# -------------------------------------practice-------------------------------

puts "\n\n"

def add_four(number)
  number + 4
end

# Practice using gets
puts "Enter a number:"
input = gets.chomp.to_i
puts "#{input} + 4 = #{add_four(input)}"



# practice using return keyword
def add_four(number)
  number + 4
  return number + 5
end

returned_value2 = add_four(input)      # => input + 5 instead of + 4
puts returned_value2



# practice usinga default method parameter
def add_four(number = 0)
  foo = number + 4
end

puts add_four            # @> 4