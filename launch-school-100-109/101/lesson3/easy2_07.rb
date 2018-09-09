# easy2_07.rb
# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet" \
         " dinosaur."

puts !!(advice =~ /dino/)

puts !!(advice.match(/dino/))

puts advice.include?('dino')

puts !!(advice.scan(/dino/))

puts !!(advice.match('dino'))
