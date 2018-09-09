# exercise1.rb
# Write a program that checks if the sequence of characters "lab" exists in the following strings:
#  "laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear".
# If it does exist, print out the word.



# define method called has_lab? which takes an array of words and prints out ones containing the string "lab"
def has_lab?(words)
  words.each do |word|          # iterates through words array
    puts word if /lab/ =~ word        # prints out word if word contains the regular expression "lab" in its string
  end
end

words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

has_lab?(words)



# Book solution

puts "\n"

def check_in(word)
  if /lab/i =~ word       # i  option after regex makes it case insensitive
    puts word
  else
    puts "No match"
  end
end

check_in("laboratory")
check_in("experiment")
check_in("Pans Labyrinth")
check_in("elaborate")
check_in("polar bear")