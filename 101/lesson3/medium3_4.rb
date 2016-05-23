# medium3_4.rb
# To drive that last one home...let's turn the tables and have the string show
# a modified output, while the array thwarts the method's efforts to modify the
# caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# my_string will have a value of 'rutabaga' because gsub! mutates the caller, so
# when it is called on the a_string_param, which points to the same object as
# my_string, then both a_string_param and my_string will be permanently
# modified, as what's being modified is the object that they both point to.
# my_array will still have a value of ['pumpkins'] because when my_array is
# passed in to the method it has the same object id as an_array_param, until
# an_array_param gets reassigned to a new array, with a different object id,
# pointing to a different object in memory. So my_array is left unchanged after
# the method finishes executing.
