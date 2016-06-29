# medium2_01_longest_sentence.rb
# Longest Sentence

# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end with
# periods (.), exclamation points (!), or question marks (?). Any sequence of
# characters that are not spaces or sentence-ending characters should be treated
# as a word. You should also print the number of words in the longest sentence

# (Note that each -- counts as a word.)

def longest_sentence(file)
  text = File.read(file).gsub(/\s/, ' ').squeeze(' ')
  sentences = text.split(/\.|\?|!/).map(&:split).sort_by(&:size)
  longest = text[/#{sentences.last.join(' ')}(\.|\?|!)/]
  num_of_words = sentences.last.size
  puts " => The longest sentence in '#{file}' is: \n'#{longest}'"
  puts " => It is #{num_of_words} words long."
end

longest_sentence('longest_sentence1.txt')
puts
longest_sentence('longest_sentence2.txt')
puts
longest_sentence('pg84.txt')
puts
puts


# Book solution:
def longest_sentence(file)
  text = File.read(file)
  sentences = text.split(/\.|\?|!/)
  longest = sentences.max_by { |sentence| sentence.split.size }.strip
  num_of_words = longest.split.size
  puts " => The longest sentence in '#{file}' is: \n'#{longest}'"
  puts " => It is #{num_of_words} words long."
end

longest_sentence('longest_sentence1.txt')
puts
longest_sentence('longest_sentence2.txt')
puts
longest_sentence('pg84.txt')
puts
puts


# What about finding the longest paragraph or longest word? How would we go
# about solving that problem?
def longest_paragraph(file)
  text = File.read(file).delete("\r")
  paragraphs = text.split(/\n{2,}/)
  longest = paragraphs.max_by { |p| p.split.size }
  num_of_sentences = longest.split(/\.|\?|!/).size
  puts longest, num_of_sentences
end

longest_paragraph('longest_sentence1.txt')
puts
longest_paragraph('longest_sentence2.txt')
puts
longest_paragraph('pg84.txt')
puts
puts

def longest_word(file)
  longest = File.read(file).split(/\W/).max_by(&:size)
  puts longest, longest.size
end

longest_word('longest_sentence1.txt')
puts
longest_word('longest_sentence2.txt')
puts
longest_word('pg84.txt')
