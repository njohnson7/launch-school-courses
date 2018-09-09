# easy3_3.rb
# How can we add multiple items to our array? (Dino and Hoppy)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.push('Dino', 'Hoppy')

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.push('Dino').push('Hoppy')

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones << 'Dino' << 'Hoppy'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.concat(%w(Dino Hoppy))

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones + %w(Dino Hoppy)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.insert(-1, 'Dino', 'Hoppy')

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones[6, 2] = %w(Dino Hoppy)
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones[6..7] = %w(Dino Hoppy)
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.unshift('Dino', 'Hoppy')

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones = flintstones.zip(%w(Dino Hoppy)).flatten.compact
