# Pig Latin is a made-up children's language that's intended to be confusing. It
# obeys a few simple rules (below), but when it's spoken quickly it's really
# difficult for non-children (and non-native speakers) to understand.

#     Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end
#     of the word.

#     Rule 2: If a word begins with a consonant sound, move it to the end of the
#     word, and then add an "ay" sound to the end of the word.

# There are a few more rules for edge cases, and there are regional variants too

# input: String of 1+ space separated words
# output: String transformed acc. to rules:
  # word starts with vowel sound -> word + 'ay'
    # ex: yt (yttria), xr (xray)
  # word starts w/ consonant -> move first SOUND to end of word, and append 'ay'
    # ex: k, ch, qu, squ, th, thr, sch, y(e), x(e)
# algorithm:
  # make an array containing consonant sounds, and another w/ vowel sounds
  # split str into words and map
  # check whether word starts w/ consonant or vowel sound
    # vowel -> append 'ay'
    # consonant -> slice consonant sound from start and prepend, then append 'ay'
  # join mapped words w/ space

# module PigLatin
#   # VOWELS = %w[a e i o u xr yt]
#   # CONSONANTS = %w[b ch c d f g h j k l m n p qu q r sch squ s thr th v w x y z ]
#   VOWELS = /\b((a|e|i|o|u|xr|yt)\w+)/i
#   CONSONANTS = /\b(?!xr|yt)(b|ch|c|d|f|g|h|j|k|l|m|n|p|qu|q|r|sch|squ|s|thr|th|v|w|x|y|z)(\w+)/i

#   def self.translate(str)
#     # words = str.split
#     # words.map { |word| }
#     # str.gsub(VOWELS, '\1ay').gsub(CONSONANTS, '*')
#     str.gsub(CONSONANTS, '\2\1').gsub(/(\w+)/, '\1ay')
#   end
# end

module PigLatin
  CONSONANT_SOUND_WORDS =
    /\b(?![xy][^aeiou])(b|ch|c|d|f|g|h|j|k|l|m|n|p|qu|q|r|sch|squ|sh|s|thr|th|v|w|x|y|z)(\w+)/i

  def self.translate(str)
    str.gsub(CONSONANT_SOUND_WORDS, '\2\1').gsub(/(\w+)/, '\1ay')
  end
end

p PigLatin.translate 'quick ugly fast run action'
p PigLatin.translate 'therapy cool man wow excellent'
p PigLatin.translate 'the dog is the cat in the hat'
p PigLatin.translate 'xray'
p PigLatin.translate 'yttria'
p PigLatin.translate 'Y'
