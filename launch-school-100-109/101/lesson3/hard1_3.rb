# hard1_3.rb
# In other exercises we have looked at how the scope of variables affects the
# modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one
# scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# # The above code will print out:
# "one is: one"
# "two is: two"
# "three is: three"
# This is because the method uses the '=' operator on the arguments that get
# passed in to at as parameters, which reassigns these arguments to new values
# that point to different objects in memory. Therefore the original variables
# that get passed in remain unmodified.


# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# The above code will print out the same as in example A:
# "one is: one"
# "two is: two"
# "three is: three"
# This is for the same reasons as in example A. It doesn't matter what values
# the variables passed in get re-assigned to, but as long as they are just being
# reassigned, then the original object remains unmodified.


# C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# The above code will print out the same as in example A:
# "one is: two"
# "two is: three"
# "three is: one"
# This is because when the variables one, two, and three get passed in to the
# method, the newly created local variables in the method and the original
# variables that got passed in are both pointing to the same objects
# respectively. Therefore, any destructive method that gets called on the
# method's variables will also be acting on the original variables, since
# destructive methods change the actual object a variable points to, not just
# act on or create a new object. Therefore when String#gsub! is called on the
# method's variables, the object that they point to itself is mutated, and then
# when the original variables are referenced after executing the method, they
# show the resulting modification of the object they point to.
