# exercise16.rb
# Take the following array and turn it into a new array that consists of strings containing one word.



# given:
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a.map! do |string|        # calls map! method on array a which mutates the caller
  string.split        # removes the spaces from the strings in the array, putting each of the two words in a nested array in array a
end

a.flatten!        # removes the nested arrays contained in array a, mutating the caller

p a



# BOOK SOLUTION:
# reassigns return values of map and flatten to array a using assignment instead of the destructive versions of the methods, map! and flatten!

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a = a.map { |pairs| pairs.split }       # puts block on a single line instead of 2, since it is short
a = a.flatten

p a



# Concise version:

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

p a.map! { |pairs| pairs.split }.flatten!       # all on 1 line!