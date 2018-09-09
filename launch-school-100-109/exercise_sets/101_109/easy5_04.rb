# easy5_04.rb
# Letter Swap

# Given a string of words separated by spaces, write a method that takes this
#  string of words and returns a string in which the first and last letters of
#  every word is swapped.

# You may assume that every word contains at least one letter, and that the
#  string will always contain at least one word. You may also assume that each
#  string contains nothing but words and spaces

def swap(str)
  str.split.each do |word|
    last_letter = word[-1]
    word[-1] = word[0]
    word[0] = last_letter
  end.join(' ')
end



p swap('Oh what a wonderful day it is') #=> 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #=> 'ebcdA'
p swap('a') #=> 'a'
p swap('This is a test')
puts


# Alternate solution:
def swap(str)
  str.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
end

p swap('Oh what a wonderful day it is') #=> 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #=> 'ebcdA'
p swap('a') #=> 'a'
p swap('This is a test')
puts


# Alternate solution 2:
def swap(str)
  str.split.each do |word|
    first, last = [word.slice!(0), word.slice!(-1)]
    word.prepend(last) unless last == nil
    word << first
  end.join(' ')
end

p swap('Oh what a wonderful day it is') #=> 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #=> 'ebcdA'
p swap('a') #=> 'a'
p swap('This is a test')
puts


# How come our solution does not use the return value of
#  swap_first_last_characters? Suppose we had this method:

def swap_first_last_characters(a, b)
  a, b = b, a
end

# (disregard the lousy name) and called it like this:

word = 'day'

p swap_first_last_characters(word[0], word[-1])

# Would this method work? Why or why not?

# This method will just return the first and last characters of the word in
#  reverse order, as a 2 element array, since the only line in the method is the
#  assignment of the variables a and b, which returns a and b. Because we are
#  passing in the first and last characters of the word to the method,
#  the method points the variables a and b to those 2 characters, and then
#  reassigns a and b, so the word remains unmodified. It would only be modified
#  if we called String#[]= directly on it, because that is element assignment,
#  not reassignment.
