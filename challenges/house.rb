# Write a program that outputs the nursery rhyme "This is the House that Jack Built".

# The nursery rhyme reads as follows:

# This is the house that Jack built.

# This is the malt
# that lay in the house that Jack built.

# This is the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the rooster that crowed in the morn
# that woke the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the farmer sowing his corn
# that kept the rooster that crowed in the morn
# that woke the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the horse and the hound and the horn
# that belonged to the farmer sowing his corn
# that kept the rooster that crowed in the morn
# that woke the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# Please build your solution based on this partial program:

# class House
#   def self.recite
#     new.verses
#   end

#   # def verses
#   #   verses = (0...12).map do |idx|
#   #     "This is #{pieces.drop(idx).map { |piece| piece.join("\n")}.join(' ')}."
#   #   end
#   #   "#{verses.reverse.join("\n\n")}\n"
#   # end

#   def verses
#     (0...12).map do |idx|
#       "This is #{pieces.drop(idx).map { |piece| piece.join("\n")}.join(' ')}."
#     end.reverse.join("\n\n") + "\n"
#   end

#   private

#   def pieces
#     [
#       ['the horse and the hound and the horn', 'that belonged to'],
#       ['the farmer sowing his corn', 'that kept'],
#       ['the rooster that crowed in the morn', 'that woke'],
#       ['the priest all shaven and shorn', 'that married'],
#       ['the man all tattered and torn', 'that kissed'],
#       ['the maiden all forlorn', 'that milked'],
#       ['the cow with the crumpled horn', 'that tossed'],
#       ['the dog', 'that worried'],
#       ['the cat', 'that killed'],
#       ['the rat', 'that ate'],
#       ['the malt', 'that lay in'],
#       ['the house that Jack built']
#     ]
#   end
# end




class House
  define_singleton_method(:recite) { new.recite }

  def recite
    (0...12)
      .map { |i| "This is #{pieces.drop(i).map { |pc| pc.join("\n")}.join(' ')}." }
      .reverse.join("\n\n") + "\n"
  end

  private

  def pieces
    [ ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built'] ]
  end
end
