# easy7_03.rb
# Capitalize Words

# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument, but the first letter of
# every word is now capitalized.

# You may assume that words are any sequence of non-blank characters, and that
# only the first character of each word must be considered.

def word_cap(words)
  words.split.map { |word| word[0].upcase + word[1..-1] }.join(' ')
end

p word_cap('four score and seven') #=> 'Four Score And Seven'
p word_cap('the javaScript language') #=> 'The JavaScript Lanugage'
p word_cap('this is a "quoted" word') #=> 'This Is A "quoted" Word'
puts


# Alternate solution:
def lowercase_to_uppercase
  lowercase = ('a'..'z').to_a
  uppercase = ('A'..'Z').to_a
  lowercase_to_uppercase = {}
  lowercase.each_with_index do |letter, idx|
    lowercase_to_uppercase[letter] = uppercase[idx]
  end
  lowercase_to_uppercase
end

def word_cap(words)
  lowercase_to_uppercase_hash = lowercase_to_uppercase
  words.split.map do |word|
    if lowercase_to_uppercase_hash.keys.include?(word[0])
      lowercase_to_uppercase.fetch(word[0]) + word [1..-1]
    else
      word
    end
  end.join(' ')
end

p word_cap('four score and seven') #=> 'Four Score And Seven'
p word_cap('the javaScript language') #=> 'The JavaScript Lanugage'
p word_cap('this is a "quoted" word') #=> 'This Is A "quoted" Word'
puts


# Alternate solution 2:
def word_cap(words)
  words.split.map { |word| word.gsub(/^[a-z]/, lowercase_to_uppercase) }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The JavaScript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
puts
