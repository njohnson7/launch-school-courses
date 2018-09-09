# easy8_07.rb
# Double Char Part 1

# Write a method that takes a string, and returns a new string in which every
#  character is doubled.

def repeater(str)
  str.chars.map { |c| c * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
puts


# Alternate solution:
def repeater(str)
  str.each_char.with_object('') { |c, s| s << c << c }
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
