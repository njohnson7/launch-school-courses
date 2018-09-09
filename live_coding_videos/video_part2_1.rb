# video_part2_1.rb
# Write a method that will return a substring based on specified indices.

def substring(str, num1, num2 = num1)
  str[num1..num2]
end

p substring('honey', 0, 2) #=> 'hon'
p substring('honey', 1, 2) #=> 'on'
p substring('honey', 3, 9) #=> 'ey'
p substring('honey', 2)    #=> 'n'
puts


# Write a method that finds all substrings in a string. No 1 letter words.

def substrings(str)
  substrings_ary = []

  str.each_char.with_index do |char, idx|
    counter = idx + 1
    while counter < str.length
      substrings_ary << substring(str, idx, counter)
      counter += 1
    end
  end

  substrings_ary
end

p substrings('band') #=> ['ba', 'ban', 'band', 'an', 'and', 'nd']
p substrings('world') #=> ['wo', 'wor', 'world', 'world', ...]
p substrings('ppop')
p substrings('testing')
puts


def substrings_recursive(str)
  substrings_ary = []
  str_ary = str.chars

  if str_ary.length > 0
    str.each_char.with_index do |char, idx|
      substrings_ary << substring(str, 0, idx + 1)
    end
    str_ary.shift
    substrings_ary += substrings_recursive(str_ary.join)
  end

  substrings_ary.uniq.select { |str| str.length > 1 }
end

p substrings_recursive('band') #=> ['ba', 'ban', 'band', 'an', 'and', 'nd']
p substrings_recursive('world') #=> ['wo', 'wor', 'world', 'world', ...]
p substrings_recursive('ppop')
p substrings_recursive('testing')
puts


# Write a method that will return all substrings that are palindromes within a
# string.

def palindromes(str)
  substrings(str).select { |substr| substr.reverse == substr }.uniq
end

p palindromes('ppop') #=> ['pp', 'pop']
p palindromes('coop')
p palindromes('mississippi')
puts


# Write a method that finds the largest substring that is a palindrome within a
# string.

def largest_palindrome(str)
  palindromes(str).sort_by { |palindrome| palindrome.length }.last
end

p largest_palindrome('ppop') #=> 'pop'
p largest_palindrome('coop')
p largest_palindrome('mississippi')