# doubler_recursion.rb
# Find out what the double of a number is, then the double of that number, etc, until
#  the pre-doubled number is 10 or greater



# 1st way

# create a method
def doubler(start)
  puts start * 2
end

# and use it like this:
doubler(2)        # => 4
doubler(4)        # => 8
doubler(8)        # => 16


# 2nd way - do it much more simply using recursion

def doubler(start)
  puts start
  if start < 10
    doubler(start * 2)
  end
end

doubler(2)