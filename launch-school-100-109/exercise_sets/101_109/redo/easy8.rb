# easy8.rb


puts '----------1---------'

#  1.     Sum of Sums
def sum_of_sums(arr)
  arr.size.downto(1).reduce(0) { |sum, n| sum + arr[-n] * n }
end


p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35




puts
puts '----------2---------'

#  2.     Madlibs
def madlib
  puts 'Enter a noun:'
  noun = gets.chomp
  puts 'Enter a verb:'
  verb = gets.chomp
  puts 'Enter an adjective:'
  adj = gets.chomp
  puts 'Enter an adverb:'
  adv = gets.chomp

  puts format("Do you %s your %s %s %s? That's hilarious!", verb, adj, noun, adv)
end


# madlib





puts
puts '----------3---------'

#  3.     Leading Substrings
def substrings_at_start(str)
  (1..str.size).map { |size| str[0, size] }
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']




puts
puts '----------4---------'

#  4.     All Substrings
def substrings(str)
  (0...str.size).flat_map { |idx| substrings_at_start(str[idx..-1]) }
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]




puts
puts '----------5---------'

#  5.     Palindromic Substrings
def palindromes(str)
  substrings(str).select { |sub| sub.size > 1 && sub == sub.reverse }
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





puts
puts '----------6---------'

#  6.     fizzbuzz
def fizzbuzz(n1, n2)
  (n1..n2).map do |n|
    if n % 15 == 0   then 'FizzBuzz'
    elsif n % 5 == 0 then 'Buzz'
    elsif n % 3 == 0 then 'Fizz'
    else                  n
    end
  end.join(', ')
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11,
                  #   Fizz, 13, 14, FizzBuzz




puts
puts '----------7---------'

#  7.     Double Char (Part 1)
def repeater(str)
  str.gsub(/./, '\0\0')
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''




puts
puts '----------8---------'

#  8.     Double Char (Part 2)
def double_consonants(str)
  str.gsub(/[b-z&&[^aeiou]]/i, '\0\0')
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ''





puts
puts '----------9---------'

#  9.     Convert number to reversed array of digits
def reversed_number(num)
  num.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1





puts
puts '----------10---------'

#  10.    Get The Middle Character
def center_of(str)
  middle = str.size.fdiv(2)
  str[middle.ceil - 1..middle]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'