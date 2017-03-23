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

p palindrome('3non')
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
p palindrome('1241miss124im1(@23')
puts '-----'
p palindrome('1241miss124im1(@a23')
p palindrome('1241misss124im1(@a23')
p palindrome('no1')
p palindrome('3on')
p palindrome('motor')
