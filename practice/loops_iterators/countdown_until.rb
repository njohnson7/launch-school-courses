# countdown_until.rb
    # same result as countdown.rb but uses until loop instead of while loop



x = gets.chomp.to_i

until x < 0       # until loop
  puts x
  x -= 1
end

puts "Done!"