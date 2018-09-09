# exercise1.rb
# What does the each method in this program return after it is finished executing?



x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end


# It will return [1, 2, 3, 4, 5] because even though the each method calls the given block
# once for each element in the array, passing that element as a parameter, it actually
# returns the array itself. (source: ruby-doc.org)

# So it is performing the operation of adding 1 to each element of array x in this case,
# but it is not returning that value; instead it is returning the original value.

# If you were to change what's inside the block to puts a + 1, then it would print out 2, 3
# 4, 5, 6, but it would still return 1, 2, 3, 4, 5.



# test code:

x = [1, 2, 3, 4, 5]
puts(
  x.each do |a|
    a + 1
  end
  )

puts "\n"
x = [1, 2, 3, 4, 5]
x.each do |a|
  puts a + 1
end

puts "\n"
x = [1, 2, 3, 4, 5]
puts( x.each { |a| a + 1 } )


# VIDEO NOTES:
# This exercise is testing your knowledge that every ruby expression returns something.
# The each iterator returns the original value (the original array).
    # So this iteration is doing nothing. It's incrementing each value, but not doing anything
    #  with it - not printing it or saving it.
        # At the conclusion of this iteration, nothing happens to the original array, and
        #  there's no new array being created.
            #  Only local variable a is created, but it is gone as soon as expression is complete.