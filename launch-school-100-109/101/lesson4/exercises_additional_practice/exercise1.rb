# exercise1.rb

# Turn this array into a hash where the names are the keys and the values are
# the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

p flintstones.map.with_index { |name, idx| [name, idx] }.to_h


# solution 2:

p flintstones.each_with_index.with_object({}) { |(name, i), hsh| hsh[name] = i }