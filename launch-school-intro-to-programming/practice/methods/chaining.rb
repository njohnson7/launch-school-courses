# chaining.rb


# returns the value passed in, incremented by 3
def add_three(n)
  n + 3
end

add_three(5)        # returns => 8


# since add_three returns a value, we can then keep calling methods on the returned value

# calls the times method on the returned value of add_three(5), which is 8
add_three(5).times { puts 'this will print 8 times' }       # prints 8 times
    # returns => 8 , so we can keep chaining method calls if we want to


# method chaining example

"hi there".length.to_s        # returns => "8" - a String
                              # length method returns an integer and to_s converts to string



# modifcation to add_three method
def add_three(n)
  puts n + 3        # now we're using puts to output the incremented value, as opposed to implicitly
                    # returning it
end

# CODE:
    # add_three(5).times { puts "will this work?" }
        # NoMethodError: undefined method `times' for nil:NilClass

add_three(5)        # @> 8
# => nil
    # 'puts' returns nil, and since 'puts n + 3' is the last expression in the method,
    # nil is now being returned by the add_three method
        # we can no longer use add_three to keep chaining methods, since it returns nil

# Important aspect of chaining methods:
    # if anywhere along the chain, there's a nil or an exception thrown, the entire chained
    # call will break down


# Fix to make add_three method print out incremented value, as well as return it
def add_three(n)
  new_value = n + 3
  puts new_value
  new_value       # can also use 'return new_value', but since new_value is the last expression
                  # in the method, it's being implicitly returned
end



#-------------practice-------------#


add_three(5).times { puts "this should work now" }        # works again since add_three returns a value
    # new_value is returned b/c it is the last expression in the method