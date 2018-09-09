# exercise3.rb
# Iterates through an array using each_with_index method and prints each index and value
#  of the array


# initialize variable called array containing an array with 6 numbers
array = [4, 5, 6, 7, 8, 9]

# prints out the index and values of each number in the array using iteration
array.each_with_index { |value, index| puts "#{index}: #{value}" }


# Book solution

top_five_games = ["mario brothers",
                  "excite bike",
                  "ring king",
                  "castlevania",
                  "double dragon"]

top_five_games.each_with_index do | game, index |
  puts "#{index + 1}. #{game}"        # increments index number by 1 for readability
end