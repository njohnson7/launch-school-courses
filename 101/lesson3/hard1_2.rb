# hard1_2.rb
# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a] #=> 'hi'
informal_greeting << ' there' #=> 'hi there'

puts informal_greeting  #  => "hi there"
puts greetings

# the last line will print out {:a=>"hi there"} because when we assigned
# informal_greeting to greetings[:a], ruby made them both point to the same
# object, with the same object id, and the same location in memory. String#<< is
# a destructive method, that mutates the caller, so when we call << on the
# informal_greeting variable, it permanently modifies the object that the
# informal_greeting variable is pointing to, which happens to be the same object
# that greetings[:a] is pointing to. Therefore, the object that both of these
# variables are pointing to is modified, so when we call puts on the greetings
# hash, it will output the modified version of the hash, with the value of :a
# having been changed to 'hi there'.
