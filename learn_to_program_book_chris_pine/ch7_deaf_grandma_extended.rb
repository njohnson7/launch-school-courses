# ch7_deaf_grandma_extended.rb




puts "What would you like to say to Grandma?"

while true
  input = gets.chomp
  if input == "BYE"
    puts "HUH!? SPEAK UP, SONNY!"
    input = gets.chomp
    if input == "BYE"
      puts "HUH!? SPEAK UP, SONNY!"
      input = gets.chomp
      if input == "BYE"
        puts "OK THEN, BYE!"
        break
      end
    end
  elsif input == input.upcase
    year = 1930 + rand(21)
    puts "NO, NOT SINCE #{year}!"
  else
    puts "HUH!? SPEAK UP, SONNY!"
  end
end