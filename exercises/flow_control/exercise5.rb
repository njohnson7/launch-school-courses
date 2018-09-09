# exercise5.rb - evaluate_num_revisited
# rewrite program from exercise 3 using a case statement
# wrap the statement from exercise 3 in a method
# wrap this new case statement in a method
# make sure they both still work



# defines a method called gets_num that prompts user to input a number and returns it
# as an integer
def gets_num
  print "Please enter a number between 0 and 100: "
  num = gets.chomp.to_i
end

# defines a method called num_value that takes the parameter number, and prints out whether
# the number is below 0, between 0 and 50, between 51 and 100, or above 100, using a case
# statement without an argument
def num_value(number)
  case
  when number < 0
    puts "You can't enter a negative number!"
  when number <= 50
    puts "#{number} is between 0 and 50."
  when number <= 100
    puts "#{number} is between 51 and 100."
  else
    puts "#{number} is above 100."
  end
end

num_value(gets_num)       # calls the num_value method using the gets_num method as an argument


# Part 2 - same as above but using an if/else statement instead of a case statement

def num_value2(number)
  if number < 0
    puts "You can't enter a negative number!"
  elsif number <= 50
    puts "#{number} is between 0 and 50."
  elsif number <= 100
    puts "#{number} is between 51 and 100."
  else
    puts number.to_s + " " + "is above 100."        # practice with string concatenation
  end
end

num_value2(gets_num)


# Book solution - using case statement method with an argument

def num_value3(number)
  case number
  when 0..50                                       # alternate syntax for >= 0 and <= 50
    puts "#{number} is between 0 and 50."
  when 51..100
    puts "#{number} is between 51 and 100."
  else
    if number < 0                                  # embedded if/else statement
      puts "You can't enter a negative number!"
    else
      puts "#{number} is above 100."
    end
  end
end

num_value3(gets_num)



# VIDEO NOTES:
# can use case statement with or without an argument
    # without an argument in case statement, whens can evaluate anything,
    # as long as the result is boolean

# case statement with an argument
    # passing in an argument to case call
    # so the when clauses underneath the case pertain to the object we're dealing with

def test(n)
  case n
  when true
    puts "this is true"
  when 1
    puts "this is 1"
  end
end

test(1)  # => this is 1
             # it evaluated the when true clause, but did not print out "this is true",
             # instead it went to next line and executed it because it matched

             # when we pass in an argument, the when true line becomes an object that we
             # compare to, and true does not equal to the object, so it goes to next line


# 0..50 is a range
    # not evaluating a boolean anymore, just matching the argument to what comes
    # after the when clause
        # so we have to add in if/else statement under else for < 0 and > 100


# 2 ways to use a case statement - w/ or w/o an argument:

    # 1) don't pass an argument into a case statement:
        # when clauses behave pretty much just like if/else blocks,
        # so can use ruby expression that evaluates to a boolean

    # 2) pass an argument into a case statement:
        # we have to make sure that expression after when clause compares in terms of
        # equality to the argument in the case statement
            # useful in some scenarios like to evaluate if the object is a hash, do something,
            # or if it's an array, do something else