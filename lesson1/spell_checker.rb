# lesson1/spell_checker.rb

words = File.readlines('/usr/share/dict/words').map(&:strip)

list = %w(counterinterpretation
undivable
factitude
aspartate
homocline
azadracta
aminoanthraquinone
selectionism
plerosis
blennostatic
bragger
connivantly
antiapostle
unsulphinated
underagitation
mesocephalon
chafman
cabal
wittiness
asdasdasdad
cat
dog
rat
perukiership)

wrong = list.select { |word| !words.include?(word) }
# p wrong
# p list.size
# p wrong.size

# puts "There are #{wrong.size} misspelled words:"
# wrong.each { |w| puts w }

File.open('errors.txt', 'w') do |f|
  f.puts "There are #{wrong.size} misspelled words:"
  wrong.each { |w| f.puts w }
end
