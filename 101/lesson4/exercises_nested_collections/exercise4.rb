# exercise4.rb

# Using the each method, write some code to output all of the vowels from the
# strings.

hsh = { first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog'] }

hsh.each_value do |words|
  words.each { |word| word.each_char { |char| puts char if char[/[aeiou]/i] } }
end
puts


# Solution 2:
puts hsh.values.join.chars.select { |c| c[/[aeiou]/i] }