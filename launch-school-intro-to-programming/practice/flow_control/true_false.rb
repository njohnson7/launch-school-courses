# true_false.rb



# after if and elsif, must put expression that evaluates to a boolean value

a = 5

if a
  puts "how can this be true?"
else
  puts "it is not true"
end
# @> how can this be true?

# in ruby, ever expression evaluates to true when used in flow control, except for false and nil


# even this is true
# it's not testing whether x is equal to 5, it's assigning the var x to the value of 5 which will
# always evaluate to true
# looks similar to x == 5, which tests whether x is equal to 5
# be careful when reading/writing ruby b/c its expressiveness can also be a source of many subtle bugs
if x = 2
  puts "how can this be true?"
else
  puts "its not true"
end