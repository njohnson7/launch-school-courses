# ch7_deaf_grandma_book.rb



puts 'HEY THERE, SONNY!  GIVE GRANDMA A KISS!'

while true
  said = gets.chomp
  break if said == "BYE"
  response = if said != said.upcase
    'HUH?!  SPEAK UP, SONNY!'
  else
    "NO, NOT SINCE #{rand(1930..1950)}!"
  end
  puts response
end

puts 'BYE SWEETIE!'