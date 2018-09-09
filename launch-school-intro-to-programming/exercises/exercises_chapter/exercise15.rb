# exercise15.rb
# Use Ruby's Array method delete_if and String method start_with? to delete all of the words that begin with an "s" in the following array:
#   arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
# Then recreate the arr and get rid of all the words that start with "s" or starts with "w".




arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |string| string.start_with?("s") }        # removes any strings from array starting with letter "s"
p arr

# recreates the above array
arr.unshift('snow')       # prepends 'snow' to array
arr.insert(3, 'slippery', 'salted roads')       # inserts 2 strings at index 3
p arr


arr.delete_if { |string| string.start_with?("s") || string.start_with?("w") }       # removes any string starting with letter "s" or "w"
p arr

puts "---------"



# Since the exercise technically asks for getting rid of all the words that start with "s" or "w" and not all the strings, I refactored the
#  above to keep the second part of 'salted roads' and 'white trees':

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr_new = []
arr.each do |string|
  if string.include?(" ")       # if the string has a space character, splits the string and pushes the result to arr_new
    arr_new.push(string.split)
  else                          # otherwise it pushes the string unmodified to arr_new
    arr_new.push(string)
  end
end

# calls flatten! method on arr_new to remove nested arrays, and then deletes any words starting with "s" or "w"
arr_new.flatten!.delete_if { |string| string.start_with?("s") || string.start_with?("w") }

p arr
p arr_new



# BOOK SOLUTION
arr.delete_if { |word| word.start_with?("s", "w") }       # uses ("s", "w") for start_with? arguments instead of  ||  operator