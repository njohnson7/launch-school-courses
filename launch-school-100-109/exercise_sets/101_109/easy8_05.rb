# easy8_05.rb
# Palindromic Substrings

# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters as it does backwards. The return value should be arranged in the
# same sequence as they substrings appear in the string. Duplicate palindromes
# should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous
# exercise.

# For the purposes of this exercise, you should consider all characters and pay
# attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
# "Abc-bA" are. In addition, assume that single characters are not palindromes.

def substrings_at_start(str)
  str.chars.each_with_object([]).with_index { |(_, a), idx| a << str[0..idx] }
end

def substrings(str)
  str.chars.each_with_object([]).with_index do |(_, a), i|
    a.concat(substrings_at_start(str[i..-1]))
  end
end

def palindromes(str)
  substrings(str).select { |s| s.size > 1 && s == s.reverse }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
p palindromes('Abcba')
puts


# Can you modify this method (and/or its predecessors) to ignore non-
#  alphanumeric characters and case?

def palindromes(str)
  str.downcase!
  str.delete!('^a-z')
  substrings(str).select { |s| s.size > 1 && s == s.reverse }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
p palindromes('Abcba')
p palindromes('A-b-c-b-a-')
