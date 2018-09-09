# easy3_08.rb
# Palindromic Strings (Part 1)

# Write a method that returns true if the string passed as an argument is a
#  palindrome, false otherwise. (A palindrome reads the same forwards and
#  backwards.) Case matters, and all characters should be considered.

# Examples:

# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true

def palindrome?(str)
  str == str.reverse
end

p palindrome?('madam') #== true
p palindrome?('Madam') #== false          # (case matters)
p palindrome?("madam i'm adam") #== false # (all characters matter)
p palindrome?('356653') #== true
puts


# Write a method that determines whether or not an array is palindromic; that
#  is, the element values appear in the same sequence both forwards and
#  backwards in the array. Now write a method that determines whether or not
#  an array or a string is palindromic. You may not use an if, unless, or case
#  statement or modifier.

def palindrome_ary?(ary)
  ary == ary.reverse
end

p palindrome_ary?([1,2,3,4,5])
p palindrome_ary?([1,2,3,4,5,4,3,2,1])
p palindrome_ary?(%w(cat dog rat))
p palindrome_ary?(%w(cat dog rat dog cat))
puts

def palindrome?(obj)
  obj == obj.reverse
end

p palindrome?('madam') #== true
p palindrome?('Madam') #== false          # (case matters)
p palindrome?("madam i'm adam") #== false # (all characters matter)
p palindrome?('356653') #== true
p palindrome?([1,2,3,4,5])
p palindrome?([1,2,3,4,5,4,3,2,1])
p palindrome?(%w(cat dog rat))
p palindrome?(%w(cat dog rat dog cat))
puts

def palindrome?(obj)
  ary = []
  (0...obj.size).each { |idx| ary << obj[idx] }
  ary == ary.reverse
end

p palindrome?('madam') #== true
p palindrome?('Madam') #== false          # (case matters)
p palindrome?("madam i'm adam") #== false # (all characters matter)
p palindrome?('356653') #== true
p palindrome?([1,2,3,4,5])
p palindrome?([1,2,3,4,5,4,3,2,1])
p palindrome?(%w(cat dog rat))
p palindrome?(%w(cat dog rat dog cat))
