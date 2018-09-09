# easy5_06.rb
# Letter Counter Part 1

# Write a method that takes a string with one or more space separated words and
#  returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

def word_sizes(str)
  sizes = {}
  str.split.each do |word|
    sizes.key?(word.size) ? sizes[word.size] += 1 : sizes[word.size] = 1
  end

  sizes.sort.to_h
end

p word_sizes('Four score and seven.') #=> { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
                                            #=> { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") #=> { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') #=> {}
p word_sizes('hey my name is sam yo')
puts


# Alternate solution:
def word_sizes(str)
  sizes = Hash.new(0)
  str.split.each { |word| sizes[word.size] += 1 }

  Hash[sizes.sort]
end

p word_sizes('Four score and seven.') #=> { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
                                            #=> { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") #=> { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') #=> {}
p word_sizes('hey my name is sam yo')
puts
