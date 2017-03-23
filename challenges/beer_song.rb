class BeerSong
  VERSES = {
    0 => "No more bottles of beer on the wall, no more bottles of beer.\n" \
         "Go to the store and buy some more, 99 bottles of beer on the wall.\n",
    1 => "1 bottle of beer on the wall, 1 bottle of beer.\n" \
         "Take it down and pass it around, no more bottles of beer on the wall.\n",
    2 => "2 bottles of beer on the wall, 2 bottles of beer.\n" \
         "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  }
  VERSES.default_proc = proc do |_, num|
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
  end

  def verse(start_num, end_num = start_num)
    start_num.downto(end_num).map { |num| VERSES[num] }.join("\n")
  end
  alias verses verse

  def lyrics
    verses(99, 0)
  end
end




# module Verse
#   def self.verse(num)
#     @verse = "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
#       "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
#   end
# end

# module VerseZero
#   def self.verse(*)
#     @verse = "No more bottles of beer on the wall, no more bottles of beer.\n" \
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#   end
# end

# module VerseOne
#   def self.verse(*)
#     @verse = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#       "Take it down and pass it around, no more bottles of beer on the wall.\n"
#   end
# end

# module VerseTwo
#   def self.verse(*)
#     @verse = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#       "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#   end
# end

# class BeerSong
#   VERSES = [VerseZero, VerseOne, VerseTwo]

#   def verse(num)
#     VERSES.fetch(num, Verse).verse(num)
#   end

#   def verses(start_num, end_num)
#     start_num.downto(end_num).map { |num| verse(num) }.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end
# end
