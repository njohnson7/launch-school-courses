# easy8_08.rb
# Double Char Part 2

# Write a method that takes a string, and returns a new string in which every
#  consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
#  whitespace should not be doubled.

def consonant?(char)
  char =~ /[a-z]/i && char =~ /[^aeiou]/i
end

def double_consonants(str)
  str.chars.map { |c| consonant?(c) ? c * 2 : c }.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
puts


# Alternate solution:
def double_consonants(str)
  str.each_char.with_object('') { |c, s| s << (consonant?(c) ? c * 2 : c) }
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
puts


# Book solution:
def double_consonants(str)
  str.each_char.with_object('') do |c, s|
    s << c
    s << c if consonant?(c)
  end
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
