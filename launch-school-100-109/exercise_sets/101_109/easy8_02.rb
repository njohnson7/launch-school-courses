# easy8_02.rb
# Madlibs

# Mad libs are a simple game where you create a story template with blanks for
# words. You, or another player, then construct a list of words and place them
# into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.

print 'Enter a noun: '
noun = gets.chomp
print 'Enter a verb: '
verb = gets.chomp
print 'Enter an adjective: '
adjective = gets.chomp
print 'Enter an adverb: '
adverb = gets.chomp

s1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
s2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
s3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

puts [s1, s2, s3].sample

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly
# Do you walk your blue dog quickly? That's hilarious!


# Another option here, one that is a bit more complicated, would be to read in a
# text file. Then, we could use String#format to interpolate our noun, verb,
# adjective, and adverb into this file.

words = { noun: noun, verb: verb, adjective: adjective, adverb: adverb }
sentences = []
File.read('sentences.txt').each_line { |l| sentences << l }
puts format(sentences.sample, words)
