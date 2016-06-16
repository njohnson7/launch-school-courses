# easy3_10.rb
# Palindromic Numbers

# Write a method that returns true if its integer argument is palindromic,
#  false otherwise. A palindromic number reads the same forwards and backwards.

# Examples:

# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true

def palindrome?(str)
  str == str.reverse
end

def palindromic_number?(num)
  palindrome?(num.to_s)
end

p palindromic_number?(34543) #== true
p palindromic_number?(123210) #== false
p palindromic_number?(22) #== true
p palindromic_number?(5) #== true
puts


# Suppose your number begins with one or more 0s. Will your method still work?
#  Why or why not? Is there any way to address this?

# No, because Ruby interprets any number starting with 0 as a number in octal
#  representation, so it doesn't store any of the leading 0's. Therefore, there
#  is no way to allow numbers with a leading 0 to be passed in to this method.
