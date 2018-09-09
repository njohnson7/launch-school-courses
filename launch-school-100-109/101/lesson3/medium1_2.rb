# medium1_2.rb
# Create a hash that expresses the frequency with which each letter occurs in
# this string:

# statement = "The Flintstones Rock"

# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }


# solution 1:
statement = "The Flintstones Rock"

letter_count = {}

statement.delete(' ').split('').sort.each do |letter|
  if !letter_count[letter]
    letter_count[letter] = 1
  else
    letter_count[letter] += 1
  end
end

puts letter_count
puts statement


# solution 2:
letter_count = {}

('A'..'z').each do |letter|
  frequency = statement.count(letter)
  letter_count[letter] = frequency if frequency >= 1
end

puts letter_count
puts statement


# solution 3:
letter_count = {}

statement.chars.sort.join.scan(/[a-zA-Z]/) do |letter|
  letter_count[letter] = statement.count(letter)
end

puts letter_count
puts statement
