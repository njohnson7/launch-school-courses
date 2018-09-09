# Write a program that, given a word and a list of possible anagrams, selects
# the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists"
# "google" "inlets" "banana" the program should return a list containing
# "inlets". Please read the test suite for exact rules of anagrams.

# input:
  # word: single word String
  # candidates: Array of words that could be possible anagrams of input word
# output: Array of words containing candidates that are anagrams of input word
# rules:
  # anagram = word that has same characters (and same size) but in different order
    # case insensitive
    # NOT ANAGRAM: same word
# data structure:
  # input: convert to Array of chars
# algorithm:
  # to_sorted_chars method:
    # downcase word, convert to Array of chars, then sort
  # select candidates where sorted_char word == sorted_char candidate
    # return selected

# class Anagram
#   def initialize(word)
#     @word = word.downcase
#   end

#   def match(words)
#     words.select { |word| anagram?(word) }
#   end

#   def sort_chars(word)
#     word.downcase.chars.sort
#   end

#   def anagram?(word)
#     @word != word.downcase && sort_chars(@word) == sort_chars(word)
#   end
# end

# using Array#sort:
class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    @word.casecmp(word).nonzero? && [@word, word].map(&sort_chars).uniq.size == 1
  end

  def sort_chars
    -> (word) { word.downcase.chars.sort }
  end
end


# using a frequency Hash instead of Array#sort:
class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    @word.casecmp(word).nonzero? && char_freq(@word) == char_freq(word)
  end

  def char_freq(word)
    chars = word.downcase.chars
    chars.uniq.map { |char| [char, chars.count(char)] }.to_h
  end
end


# using Array#count instead of Array#sort:
class Anagram
  def initialize(word)
    @word = word
    @chars = word.downcase.chars
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    chars = word.downcase.chars
    @word.casecmp(word).nonzero? && @word.size == word.size &&
      @chars.uniq.all? { |char| chars.count(char) == @chars.count(char) }
  end
end
