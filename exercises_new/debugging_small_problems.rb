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





#----- 4: reverse sentence -----#
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




#----- 5: reverse sentence -----#
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




#----- 6: neutralizer -----#
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





#----- 7: password -----#
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




#----- 8: number guessing game -----#
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

guess_number(10, 3)

