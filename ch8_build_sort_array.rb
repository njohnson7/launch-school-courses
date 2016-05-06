# ch8_build_sort_array.rb



puts "Please enter as many words as you would like. Press enter twice when done."

words = []

while true
  input = gets.chomp.capitalize
  break if input.empty?               # use .empty instead of == ""
  words << input
end

puts "These are your words in alphabetical order:"
puts words.sort