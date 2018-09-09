# easy3_2.rb
# How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.push('Dino')

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones << 'Dino'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.insert(-1, 'Dino')

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.concat(['Dino'])

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones + ['Dino']

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones[6] = 'Dino'
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.unshift('Dino')

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones = flintstones.zip(['Dino']).flatten.compact
