# exercise3.rb
# Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys.
# Then write a program that does the same thing except printing the values.
# Finally, write a program that prints both.



hash = {one: 1, two: 2, three: 3, four: 4}

puts hash.keys        # prints out all the keys of hash by calling keys method

puts hash.values        # prints out all the values of hash by calling values method

hash.each { |k, v| puts "#{k}: #{v}"}       # prints out all the values and keys of hash using each method




# Solution 2 - same result as above but uses each_key, each_value, and each_pair methods

puts "\n"

hash.each_key { |k| puts k }

hash.each_value { |v| puts v }

hash.each_pair { |k, v| puts "#{k}: #{v}" }