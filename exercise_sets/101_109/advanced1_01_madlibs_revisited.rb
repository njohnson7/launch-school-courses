# advanced1_01_madlibs_revisited.rb
# Madlibs Revisited

# Let's build another program using madlibs. We made a program like this in the
# easy exercises. This time the requirements will be a bit different.

# Make a madlibs program that reads in some text from a text file that you have
# created, and then plugs in a selection of randomized nouns, verbs, adjectives,
# and adverbs into that text and prints it. You can build your lists of nouns,
# verbs, adjectives, and adverbs directly into your program, but the text data
# should come from a file or other external source. Your program should read
# this text, and for each line, it should place random words of the appropriate
# types into the text, and print the result.

# The challenge of this program isn't about writing your program; it's about
# choosing how to represent your data. Choose the right way to structure your
# data, and this problem becomes a whole lot easier.

# Example output:

# The sleepy brown cat noisily
# licks the sleepy yellow
# dog, who lazily licks his
# tail and looks around.

WORDS = {
  'adjective' => %w(fat angry killer insane fiendish crazy ugliest disgusting
                    terrified vicious oozing flamboyant dubious filthy terrifying
                    spectacular unsightly wicked wild horrible screaming
                    fabulous wrathful slimy frantic lethal massive incompetent
                    magic intoxicated mighty earsplitting miniature bashful
                    defiant ludicrous squealing homeless disturbed pathetic
                    psychotic gigantic monstrous enormous drunk wasted fantastic
                    bloody dying),
  'verb' => %w(scream lick kill excite excite destroy wreck whistle heal wiggle
               smashe attack bathe confuse terrifie burn battle shoot murder
               boil drown hammer squeeze throw execute nail crushe choke bite
               strangle stab decapitate devour mutilate),
  'noun' => %w(cat weasel plumber bear ghost hotdog monkey monster psychopath
               chicken rat panda uncle pie potato kitty Nazi grandma spider
               elf scarecrow zombie king turkey cheese trousers butler
               mother father grandpa donkey dragon lady clown hobo baby bastard
               midget weinerdog gangster),
  'adverb' => %w(suddenly fervently repeatedly recklessly stealthily utterly
                 blissfully jovially wildly foolishly viciously completely
                 accidentally upsettingly unfortunately tenderly frenetically
                 daintily delightfully eagerly needlessly ferociously
                 ceaselessly unflinchingly joyfully angrily gleefully)
}.freeze

def madlib(file)
  text = File.read(file)
  WORDS.each do |type, words|
    word_to_sub = /%\{#{type}\}/
    while text =~ word_to_sub
      text.sub!(word_to_sub, words.sample)
    end
  end
  puts text
end

madlib('advanced_madlibs.txt')
puts


# Book solution:
ADJECTIVES = %w(fat angry killer insane fiendish crazy ugliest disgusting
                terrified vicious oozing flamboyant dubious filthy terrific
                spectacular unsightly wicked wild horrible screaming
                fabulous wrathful slimy frantic lethal massive incompetent
                magic intoxicating mighty earsplitting miniature bashful
                defiant ludicrous squealing homeless disturbed pathetic).freeze
VERBS = %w(scream lick kill excite excite destroy wreck whistle heal wiggle
           smashe attack bathe confuse terrifie burn battle shoot murder
           boil drown hammer squeeze throw execute nail crushe choke bite).freeze
NOUNS = %w(cat weasel plumber bear ghost hotdog monkey monster psychopath
           chicken rat panda uncle pie potato kitty nazi grandma spider
           elf scarecrow zombie king turkey cheese trousers butler).freeze
ADVERBS = %w(suddenly fervently repeatedly recklessly stealthily utterly
            blissfully jovially wildly foolishly viciously completely
            accidentally upsettingly unfortunately tenderly frenetically
            daintily delightfully eagerly unnecessarily ferociously).freeze

def madlib(file)
  File.read(file).each_line do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end

madlib('advanced_madlibs.txt')
puts