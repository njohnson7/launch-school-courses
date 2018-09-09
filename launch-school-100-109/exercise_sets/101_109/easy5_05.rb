# easy5_05.rb
# Clean up the words

# Given a string that consists of some words and an assortment of non-alphabetic
#  characters, write a method that returns that string with all of the
#  non-alphabetic characters replaced by spaces. If one or more non-alphabetic
#  characters occur in a row, you should only have one space in the result
#  (the result should never have consecutive spaces).

def cleanup(str)
  str.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

p cleanup("---what's my +*& liNe?") #=> ' what s my liNe '
puts


# If you originally wrote this method with regular expressions, try writing it
#  without regular expressions.

LETTERS = ('A'..'Z').to_a + ('a'..'z').to_a

def cleanup(str)
  ary = str.chars.map { |c| LETTERS.include?(c) ? c : ' ' }
  ary.delete_if.with_index { |c, idx| c == ' ' && ary[idx + 1] == ' ' }.join
end

p cleanup("---what's my +*& liNe?") #=> ' what s my liNe '
