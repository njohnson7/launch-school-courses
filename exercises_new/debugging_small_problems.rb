#----- 1: countdown -----#
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  # puts counter
  counter = decrease(counter)
end

# puts "LAUNCH!"
# puts



# puts [*10.downto(1), "LAUNCH!"]




#----- 2: hey you! -----#
def shout_out_to(name)
  name.chars.each { |c| c.upcase! }
  puts "HEY " + name
end


def shout_out_to name
  puts "HEY #{name.upcase}"
end

# shout_out_to("you") # expected: 'HEY YOU'




#----- 3: valid series? -----#
def valid_series? nums
  nums.sum == 47 && nums.count(&:odd?) == 3
end

# p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
# p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
# p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
# p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
# p valid_series?([10, 6, 19, 2, 6, 4])             # should return false





#----- 4: reverse sentence -----#
def reverse_sentence(sentence)
  words = sentence.split(" ")
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(" ")
end

def reverse_sentence sentence
  sentence.reverse.gsub /\w+/, &:reverse
end

# p reverse_sentence("how are you doing")
# expected output: "doing you are how"





#----- 5: card deck -----#
def score card
  card.is_a?(Integer) ? card : card == :ace ? 11 : 10
end

cards        = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
deck         = %i[hearts diamonds clubs spades].map { |suit| [suit, cards.dup] }.to_h
player_cards = deck.values.flat_map { |cards| cards.shuffle!.pop }
sum          = deck.values.flat_map { |cards| cards.map &method(:score) }.sum

# puts sum
# p deck.values.map &:size
# p player_cards
# p player_cards.map(&method(:score)).sum
# total_sum  = 4 * [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].sum
# player_sum = player_cards.map { |card| score(card) }.sum
# puts(sum == total_sum - player_sum) #=> false




#----- 6: getting things done -----#
def move(n, from_array, to_array)
  return if n <= 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

def move n, from_array, to_array
  move(n - 1, from_array, to_array << from_array.shift) if n.positive? && !from_array.empty?
end

# Example
todo = ["study", 'walk the dog', 'coffee with Tom']
done = ["apply sunscreen", 'go to the beach']

move(5, todo, done)

# p todo # should be: ["coffee with Tom"]
# p done # should be: ["apply sunscreen", 'go to the beach', 'study', 'walk the dog']




#----- 7: neutralizer -----#
def neutralize(sentence)
  words = sentence.split(" ")
  words.dup.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(" ")
end

def negative?(word)
  ["dull", 'boring', 'annoying', 'chaotic'].include?(word)
end

def neutralize sentence
  sentence.gsub /(dull|boring|annoying|chaotic) ?/, ""
end

# puts neutralize("These dull boring cards are part of a chaotic board game.")
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.





#----- 8: password -----#
def set_password
  puts 'What would you like your password to be?'
  gets.chomp
end

def verify_password password
  print "** Login **\nPassword: "
  puts gets.chomp == password ? 'Welcome to the inside!' : 'Authentication failed.'
end

# password   = nil
# password ||= set_password
# verify_password password




#----- 9: number guessing game -----#
def guess_number(max_number, max_attempts, winning_number = [*1..max_number].sample, attempts = 0)
  return if attempts >= max_attempts

  input = nil
  until input&.match? /\A\d+\z/
    print 'Make a guess: '
    input = gets.chomp
  end

  guess = input.to_i
  if guess == winning_number
    puts 'Yes! You win.'
  else
    puts "Nope. Too #{guess < winning_number ? 'small' : 'big'}."
    guess_number max_number, max_attempts, winning_number, attempts + 1
  end
end

# guess_number(10, 3)





#----- 10: TF-IDF -----#
# Term frequency - inverse document frequency:
# A measure of how important a term is to a document in a collection of documents
# (the importance increases proportionally to the term frequency in the document,
# but decreases with the frequency of the word across documents)
def tfidf(term, document, documents)
  tf(term, document) * idf(term, documents)
end

# Term frequency (simple version):
# the number of times a term occurs in a document
def tf(term, document)
  document.split(/[\s-]/).count { |word| word.downcase == term }
end

# Inverse document frequency:
# measure of how much information the word provides,
# based on the number of documents in which it occurs
# (the rarer it is, the more information it provides)
def idf(term, documents)
  count = documents.count { |d| tf(term, d).nonzero? }
  count = 1 if count.zero?
  Math.log documents.size.fdiv(count)
end

# Very simple example
document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
"it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
"a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
"quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
"In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document1, document2, document3]

# The higher the tf-idf score of a term for a document, the more informative
# it is for that document.
# E.g. when someone searches for the term 'cat' in your document collection,
# you want to return document1 and document2, but not document3.
# For the term 'quantum mechanics', on the other hand, you only want to return document1.

# expected outputs:
puts tfidf("cat", document1, documents) # ~ 1.2
puts tfidf("cat", document2, documents) # ~ 1.6
puts tfidf("cat", document3, documents) # 0
puts

puts tfidf("quantum", document1, documents) # ~ 5.5
puts tfidf("quantum", document2, documents) # 0
puts tfidf("quantum", document3, documents) # 0
puts

puts tfidf("mastery", document1, documents) # 0
puts tfidf("mastery", document2, documents) # 0
puts tfidf("mastery", document3, documents) # ~ 3.3
puts

puts tfidf("some", document1, documents) # 0
puts tfidf("some", document2, documents) # ~ 0.4
puts tfidf("some", document3, documents) # ~ 0.4
puts

docs = [document2, document3]
puts tfidf("quantum", document2, docs) # ~ 0.4
puts tfidf("quantum", document3, docs) # ~ 0.4
