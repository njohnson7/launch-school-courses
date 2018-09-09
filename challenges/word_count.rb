# Write a program that given a phrase can count the occurrences of each word in
# that phrase.

# For example, if we count the words for the input "olly olly in come free", we
# should get:

# olly: 2
# in: 1
# come: 1
# free: 1

# input: String of words
# output: Hash containing words as keys, and values as the num of occurences
#          of each word
# rules:
  # ignore punctuation (EXCEPT APOSTROPHES W/I WORDS):
    # ex: 'car : carpet 'as' java : javascript!!&@$%^&'
    #      => car, carpet, as, java, javascript
  # split on: whitespace, commas, newlines
  # include nums
  # ignore case: go Go GO => 3 go's
  # include apostophres w/i words: don't, can't
# algorithm:
  # downcase str
  # delete everything but letters, nums, and apostrophes w/i words
  # split on whitespace or commas
  # map unique words -> Hash[word, count]
    # or group_by?
  # return Hash


class Phrase
  def initialize(str)
    @words = str.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    @words.uniq.map { |word| [word, @words.count(word)] }.to_h
  end
end

class Phrase
  def initialize(str)
    @str = str
  end

  # option 1 - using String#scan to iterate:
  def word_count
    freqs = Hash.new(0)
    @str.scan(/\b[\w']+\b/) { |word| freqs[word.downcase] += 1 } && freqs
  end

  # OR:

  # option 2 - manual iteration using a while loop:
  def word_count
    idx = 0
    word_freqs = Hash.new(0)
    while (idx = @str.index(/\b\w/, idx))
      word = @str.match(/\b[\w']+\b/, idx)[0].downcase
      word_freqs[word] += 1
      idx += word.size
    end
    word_freqs
  end

  def word_count
    @str.scan(/\b[\w']+\b/).reduce(Hash.new(0)) do |hsh, word|
      (hsh[word.downcase] += 1) && hsh
    end
  end
end


# p Phrase.new("First: don't laugh. Then: don't cry.").word_count
# p Phrase.new('testing, 1, 2 testing').word_count
# p Phrase.new('one,two,three').word_count
# p Phrase.new("one,\ntwo,\nthree").word_count
# p Phrase.new('car : carpet as java : javascript!!&@$%^&').word_count
# p Phrase.new("Joe can't tell between 'large' and large.").word_count
# p Phrase.new("Joe can't a 1 'large' and large 3d.").word_count
# p Phrase.new("'Joe 'can't' a' 1 'large' 'a 'bb cc' and la''rge 3d.").word_count
