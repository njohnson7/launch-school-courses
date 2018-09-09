# medium2_02_now_i_know_my_abcs.rb
# Now I Know My ABCs

# A collection of spelling blocks has two letters per block, as shown in this
# list:

#  B:O   X:K   D:Q   C:P   N:A
#  G:T   R:E   F:S   J:W   H:U
#  V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used
# once.

# Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.

def block_word?(word)
  blocks = {
    ['B', 'O'] => 0, ['X', 'K'] => 0, ['D', 'Q'] => 0, ['C', 'P'] => 0,
    ['N', 'A'] => 0, ['G', 'T'] => 0, ['R', 'E'] => 0, ['F', 'S'] => 0,
    ['J', 'W'] => 0, ['H', 'U'] => 0, ['V', 'I'] => 0, ['L', 'Y'] => 0,
    ['Z', 'M'] => 0
  }
  word.each_char do |c|
    blocks.each_key { |block| blocks[block] += 1 if block.include?(c) }
  end
  blocks.values.none? { |count| count > 1 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('PANDA') == false
p block_word?('FRUIT') == true
p block_word?('BEAR') == false
p block_word?('WYOMING') == true
p block_word?('APRICOT') == false
puts


# Alternate solution:
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(word)
  BLOCKS.each do |block|
    counter = 0
    word.each_char { |c| counter += 1 if block.include?(c) }
    return false if counter > 1
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('PANDA') == false
p block_word?('FRUIT') == true
p block_word?('BEAR') == false
p block_word?('WYOMING') == true
p block_word?('APRICOT') == false
puts


# Book solution:
def block_word?(word)
  BLOCKS.none? { |block| word.count(block) > 1 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('PANDA') == false
p block_word?('FRUIT') == true
p block_word?('BEAR') == false
p block_word?('WYOMING') == true
p block_word?('APRICOT') == false
puts