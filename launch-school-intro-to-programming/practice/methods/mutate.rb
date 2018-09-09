# mutate.rb


# Example of a method that modifies its argument permanently
# = Mutating the Caller

# arrays = ordered lists

a = [1, 2, 3]

def mutate(array)
  array.pop       # pop method mutates the caller
                  # pop method removes the last element from self (array) and returns it
                  # if u put array after using pop on it, it will print the whole array,
                  # except for the last element
end

# we use p instead of puts here
# the 2 are similar w/ only small differences to the way ruby prints the output
# ex:
puts "using p:"
p a
p "\n"
p "-----"
puts "using puts:"
puts a
puts "\n"
puts "-----"


# Using p
puts "\n\nusing p:"
p "Before mutate method: #{a}"  # "[1, 2, 3]"
mutate(a)   # a is permanently altered, even though it is outside the method's scope
            # b/c pop mutates the caller
            # => 3
p "After mutate method: #{a}"  # "[1, 2]"

# Using puts
a = [1, 2, 3]
puts "\nusing puts:"
puts "Before mutate method: #{a}"
mutate(a)
puts "After mutate method: #{a}"
puts "\n\n"


# Example of a method that does not mutate the caller, but still returns the same value

a = [1, 2, 3]

def no_mutate(array)
  array.last          # returns the last element of self
end

p "Before no_mutate method: #{a}"
no_mutate(a)                       # => 3
p "After no_mutate method: #{a}"   # same output as above
puts "\n\n"



# Puts vs return

p "Before mutate method #{a}"     # prints out a, as originally defined
                                  # @> "Before mutate method: [1, 2, 3]"

p mutate (a)                      # prints out value returned by mutate method
                                  # @> 3
                                  # the method is returning the result of array.pop back
                                  # to where it's being called from

p "After mutate method: #{a}"     # prints value of a after mutate method
                                  # @> "After mutate method: [1, 2]"