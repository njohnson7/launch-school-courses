# ch7_deaf_grandma.rb




input = ""

while input != "BYE"
  puts "What would you like to say to Grandma?"
  input = gets.chomp
  if input == input.upcase
    year = 1930 + rand(21)
    puts "NO, NOT SINCE #{year}!"
  else
    puts "HUH!? SPEAK UP, SONNY!"
  end
end