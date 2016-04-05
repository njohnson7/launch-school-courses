# Exercise 3


# Create hash containing movies and their release year, and assign it to 'movies' variable
movies = { :Ghostbusters => 1984, :Batman => 1989, :Fargo => 1996, :Clerks => 1994, :Deadpool => 2016 }

# Outputs values of hash in order of year released, starting from most recent
puts "Deadpool: #{movies[:Deadpool]}"
puts "Fargo: #{movies[:Fargo]}"
puts "Clerks: #{movies[:Clerks]}"
puts "Batman: #{movies[:Batman]}"
puts "Ghostbusters: #{movies[:Ghostbusters]}\n\n"



# Practice creating hash with new hash syntax
movies2 = { Ghostbusters: 1984, 
            Batman: 1989, 
            Fargo: 1996, 
            Clerks: 1994, 
            Deadpool: 2016 }

puts movies2[:Ghostbusters]
puts movies2[:Batman]
puts movies2[:Fargo]
puts movies2[:Clerks]
puts movies2[:Deadpool]