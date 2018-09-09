# medium3_3.rb
# Let's call a method, and pass both a string and an array as parameters and see
# how even though they are treated in the same way by Ruby, the results can be
# different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# The value of my_string will be 'pumpkins' because when it got passed into the
# method, it got reassigned, so the method modified a copy of the string that
# points to a different object in memory, with a different object id, so the
# original my_string variable will remain unchanged.
# The value of my_array will be ['pumpkins', 'rutabaga'] because when the array
# got passed into the method, the method called the << method on it, modifying
# the object that my_array points to, with the same object id. Since
# an_array_param and my_array have the same object id, they point to the same
# location in memory, so performing a destructive method on one of them will
# have an effect on both of them.
