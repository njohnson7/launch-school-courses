# medium1_07.rb
# Word to Digit

# Write a method that takes a sentence string as input, and returns a new string
# that contains the original string with any sequence of the words 'zero',
# 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'
# converted to a string of digits.

WORD_TO_DIGIT = {
  'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5,
  'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9
}.freeze

def word_to_digit(str)
  str = str.dup
  WORD_TO_DIGIT.each_key { |word| str.gsub!(word, WORD_TO_DIGIT) }
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')\
                == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts


# Alternate solution:
def word_to_digit(str)
  str.split.map do |w|
    has_period = false
    if w.end_with?('.')
      has_period = true
      w.delete!('.')
    end
    if WORD_TO_DIGIT.key?(w)
      has_period ? "#{WORD_TO_DIGIT[w]}." : WORD_TO_DIGIT[w]
    else
      has_period ? "#{w}." : w
    end
  end.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')\
                == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts


# Alternate solution 2:
def word_to_digit(str)
  words = str.split
  words = words.map { |w| w.partition('.') }.flatten
  words.delete('')
  words.map { |w| WORD_TO_DIGIT.keys.include?(w) ? WORD_TO_DIGIT[w] : w
            }.join(' ').gsub(' .', '.')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')\
                == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts


# Book solution:
def word_to_digit(str)
  WORD_TO_DIGIT.each_key { |w| str.gsub!(/\b#{w}\b/, WORD_TO_DIGIT[w].to_s) }
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')\
                == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts


# There are probably many ways to solve this problem and different varieties of
# it. What if certain words that represent numbers can be uppercase, lowercase,
# or capitalized.
def word_to_digit(str)
  WORD_TO_DIGIT.each_key { |w| str.gsub!(/\b#{w}\b/i, WORD_TO_DIGIT[w].to_s) }
  str
end

p word_to_digit('Please call me at Five fIVe FIVE one two thrEE fouR. Thanks.')
puts

# Can you modify this so that spaces between the inserted numbers are
# eliminated? If the sentence already contains 2 or more space separated numbers
# (not words), don't delete the space between them: only the spaces between the
# converted number words should be eliminated.
def word_to_digit(str)
  WORD_TO_DIGIT.each_key { |w| str.gsub!(/\b#{w}\b/i, "*#{WORD_TO_DIGIT[w]}*") }
  str.gsub!('* *', '')
  str.delete!('*')
  str
end

p word_to_digit('num: 3 Five 4 4 fIVe SEVEN 55 one two thrEE fouR. 5 43 2 111')
puts

# What about dealing with phone numbers? Is there any easy way to format our
# string to account for phone numbers? For our purposes, assume that any 10
# digit number is a phone number, and that the proper format should be "(123)
# # 456-7890".
def word_to_digit(str)
  WORD_TO_DIGIT.each_key { |w| str.gsub!(/\b#{w}\b/i, "*#{WORD_TO_DIGIT[w]}*") }
  str.gsub!('* *', '')
  str.delete!('*')
  str.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
end

p word_to_digit('phone: eight zero zero one two three four five six seven')
