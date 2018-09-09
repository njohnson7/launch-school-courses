# ch7_deaf_grandma_extended_book2.rb



puts 'HEY THERE, PEACHES!  GIVE GRANDMA A KISS!'

bye_count = 0

while true
  said = gets.chomp
  if said == 'BYE'
    bye_count += 1
  else
    bye_count = 0
  end

  break if bye_count >= 3

  response = if said != said.upcase
    'HUH?!  SPEAK UP, SONNY!'
  else
    "NO, NOT SINCE #{rand(1930..1950)}!"
  end

  puts response
end

puts 'BYE-BYE CUPCAKE!'