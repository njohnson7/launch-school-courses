# medium2_3.rb

# In an earlier exercise we saw that depending on variables to be modified by
# called methods can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# We learned that whether the above "coincidentally" does what we think we
# wanted "depends" upon what is going on inside the method.

# How can we refactor this exercise to make the result easier to predict and
# easier for the next programmer to maintain?


# Solution 1: rename method to something more descriptive, and mutate both the
# string and the array, so that it is consistent and the return value doesn't
# matter.
def append_to_ary_and_str!(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]

append_to_ary_and_str!(my_string, my_array)

puts
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# Solution 2: extract method to 2 separate methods, then rename the methods to
# something more descriptive, then make them only return a value instead of
# mutating the caller.
def append_to_str(a_string_param)
  a_string_param += "rutabaga"
end

def append_to_ary(an_array_param)
  an_array_param += ["rutabaga"]
end

my_string = "pumpkins"
my_array = ["pumpkins"]

my_string = (append_to_str(my_string))
my_array = (append_to_ary(my_array))

puts
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# book solution:
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
