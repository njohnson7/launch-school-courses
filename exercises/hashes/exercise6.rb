# exercise6.rb
# Given an array, write a program that prints out groups of words that are anagrams.
# Anagrams are words that have the same exact letters in them but in a different order.


# Given:
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

hash = {}               # initializes an empty hash called hash
words.each do |word|        # iterates through each word in the words array
  arr = []                # initializes an empty array called arr to be used by the method below
  n = 0               # initializes variable called n, used as a counter for the following while loop for word length
  while n < word.length       # pushes each letter of each word in in words array as an element to array arr
    arr.push(word[n])
    n += 1
  end
  hash[word] = arr.sort       # alphabetically sorts the letters of each word in words array and adds the result to the hash array under
                              #  unique keys, using the strings of the original words as the keys
end

unique_array = hash.values.uniq       # finds the unique values of the hash array and assigns them to unique_array variable

len = 0               # initializes a variable called len to be used as a counter for the following while loop
while len < unique_array.length       # runs a while loop for each element of unique_array
  anagram = []        # initializes an empty array called anagram to be used by the method below
  hash.each do |k, v|       # calls each method on hash to find values of hash that match the letters of each element in unique_array
    if v == unique_array[len]       # checks if value of each key match the letters of each element in unique_array
      anagram.push(k)       # if the values match, adds the key string to anagram array
    end
end
p anagram       # prints anagram array
len += 1        # increments the length counter by 1, until all the nested array elements of unique_array have been iterated through
end



# Book Solution

result = {}       # initializes empty hash for later use of storing words that are anagrams under their key value

words.each do |word|
  key = word.split('').sort.join        # splits each word in the array into separate letters, sorts them alphabetically, then joins them
                                        #  back together into a string, and assigns them to key variable
  if result.has_key?(key)       # if key already exists, pushes word to an array contained under the value for that key
    result[key].push(word)
  else
    result[key] = [word]        # if key doesn't yet exist, creates a key containing the sorted word, and assigns the unsorted word as a
                                #  value to it
  end
end

result.each do |k, v|       # iterates through result hash, printing values for each key
  puts "------"       # delimiter for each group
  p v
end



# 1) iterate over the words array, and for each word:
#   - turn it in alphabetical order. mode => demo
#   - if the key exists ,append to the key's list
#   - else, create a new key, with this word in the list