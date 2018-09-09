# easy2_01.rb
# In this hash of people and their age,
# see if there is an age present for "Spot".

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages['Spot']

puts !!ages['Spot']

puts ages.key?('Spot')

puts ages.has_key?('Spot')

p ages.select { |name, _| name == 'Spot' }

puts ages.any? {|name, _| name == 'Spot' }

puts ages.fetch('Spot', '"Spot" not found.')

puts ages.include?('Spot')

puts ages.member?('Spot')
