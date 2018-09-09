# exercise2.rb
# Look at ruby's merge method. Notice it has 2 versions. What is the difference between merge and merge! ?
#  Write a program that uses both and illustrate the differences


# merge returns a new hash containing the combined contents of two hashes
# merge! does the same thing, but it will permanently modify the hash that it is called on



# merge

person = { firstname: "Steve", eyes: "blue", weight: "150 lbs", age: 30 }
person_more = { lastname: "Smith", hair: "brown", height: "6 feet" }



puts "person = #{person}"
puts "person_more = #{person_more}"
puts "after running person.merge(person_more):"
puts "=> #{person.merge(person_more)}"        # calls merge method on person hash with person_more hash as an argument
                                              # returns the combined key-value pairs of both hashes
puts "person = #{person}\n\n"       # the person hash is left unchanged

puts "person = #{person}"
puts "person_more = #{person_more}"
puts "after running person.merge!(person_more):"
puts "=> #{person.merge!(person_more)}"        # calls merge! method on person hash with person_more hash as an argument
                                               # returns the combined key-value pairs of both hashes
puts "person = #{person}"       # the person hash has been permanently altered; it now contains the combined key-value pairs of both
                                #  hashes
puts "person_more = #{person_more}\n\n"       # person_more is not modified by merge! method, since it is used as the argument



# Solution 2 - book solution - much better, I think I made mine needlessly complicated

cat = {name: "whiskers"}
weight = {weight: "10 lbs"}
puts cat.merge(weight)
puts cat
puts weight
puts cat.merge!(weight)
puts cat        # different now because it has been permanently modified by merge! method
puts weight



# VIDEO NOTES:
# both merge methods return the same value - a new hash that's merged - but with ! mutates the caller - changes the original object
#  that called the merge method