LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a

def palindrome(word)
  filtered_word = ''
  reversed_word = ''
  word.each_char do |char|
    next unless LETTERS.include?(char)
    filtered_word << char
    reversed_word.prepend(char)
  end
  filtered_word.casecmp(reversed_word).zero?
end

def palindrome(word)
  word.each_char.with_object(['', '']) do |char, (filtered_word, reversed_word)|
    char = char.downcase
    next unless LETTERS.include?(char)
    filtered_word << char
    reversed_word.prepend(char)
  end.uniq.size == 1
end

# def palindrome(word)
#   half_idx = word.size.fdiv(2).ceil - 1
#   left_idx = 0
#   right_idx = 0
#   loop do
#     break if left_idx > half_idx || right_idx > half_idx
#     left_char = word[left_idx].downcase
#     next left_idx += 1 unless LETTERS.include?(left_char)
#     right_char = word[-(right_idx + 1)].downcase
#     next right_idx += 1 unless LETTERS.include?(right_char)
#     return false unless left_char == right_char
#     left_idx += 1
#     right_idx += 1
#   end
#   true
# end

p palindrome('3non')
p palindrome('3o4o3')
p palindrome('3o41no3')
p palindrome('rotor')
p palindrome('redder')
p palindrome('non!')
p palindrome('no1, 3on')
p palindrome('missim')
p palindrome('MiSim')
p palindrome('MISSIm')
p palindrome('bob')
p palindrome('1241missim123')
p palindrome('1241miss124im123')
p palindrome('1241miSs124im1(@23')
puts '-----'
p palindrome('1241miSs124im1(@a23')
p palindrome('1241misss124im1(@a23')
p palindrome('no1')
p palindrome('3on')
p palindrome('motor')
