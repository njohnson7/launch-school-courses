# video_part4.rb
# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument, but the first letter of
# every word is now capitalized.

# You may assume that words are any sequence of non-blank characters, and that
# only the first character of each word must be considered.

def word_cap(str)
  str.split.each { |word| word[0] = word[0].upcase }.join(' ')
end

puts word_cap('four score and seven') #=> 'Four Score And Seven'
puts word_cap('the javaScript Language') #=> 'The JavaScript Language'
puts word_cap('this is a "quoted" word') #=> 'This Is A "quoted" Word'
puts


# PART 2:
# Write a method that returns the number of Friday the 13ths in the year passed
# in as an argument. You may assume that the year is greater than 1752 (when the
# modern Gregorian Calendar was adopted by the UK), and you may assume that the
# same calendar will remain in use for the foreseeable future.

# Hint: Ruby's 'Date' class could be helpful here.
# - look at how to initialize a Date object
# - look at the 'friday?' method

require 'date'

def friday_13th?(year)
  fridays = 0

  12.times { |month| fridays += 1 if Date.new(year, month + 1, 13).friday? }

  fridays
end

p friday_13th?(2015) #=> 3
p friday_13th?(1986) #=> 1
puts


# Write a method that will generate random English math problems. The method
# should take a lanegth, then return a math phrase with that many operations.

# Given:

NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def mathphrase(num)
  phrase = [NUMBERS.sample]

  num.times { phrase << OPERATORS.sample << NUMBERS.sample }

  phrase.each_with_index do |word, idx|
    phrase[idx] = 'divided by' if word == 'divided'
  end

  phrase.join(' ')
end

puts mathphrase(1) #=> 'five minus two'
puts mathphrase(2) #=> 'two plus three times eight'
puts mathphrase(3) #=> 'one divided by three plus five times zero'
puts mathphrase(6)
puts

def mathphrase2(num)
  phrase = [NUMBERS.sample]

  num.times { phrase << [OPERATORS.sample].zip([NUMBERS.sample]) }

  phrase.join(' ').gsub('divided', 'divided by')
end

puts mathphrase2(1) #=> 'five minus two'
puts mathphrase2(2) #=> 'two plus three times eight'
puts mathphrase2(3) #=> 'one divided by three plus five times zero'
puts mathphrase2(6)
puts


# Write a program that will generate random English math problems of varying
# length.

def mathphrase_random_length(num = 1)
  mathphrases = []

  num.times { mathphrases << mathphrase(rand(10) + 1) }

  mathphrases
end

puts mathphrase_random_length
puts
puts mathphrase_random_length(5)
puts
puts mathphrase_random_length(10)
