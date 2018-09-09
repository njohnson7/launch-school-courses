# exercise5.rb
# What method could you use to find out if a Hash contains a specific value in it?
# Write a program to demonstrate this use.



person = { name: "Bob", age: "47", weight: "160 lbs", eye_color: "brown" }

# Prompts user to type in a string that will be used to search a hash
print "Search hash for: "
input = gets.chomp


# Finds out if hash contains the user input string

# select method
person.select do |k, v|
  if v == input
    puts "Bob's #{k} is #{v}."
  end
end


# each_value method
person.each_value do | v |
  if v == input
    puts "The hash contains #{v}."
  end
end


# has_value? method
if person.has_value?(input)
  puts "The hash contains #{input}."
else
  puts "The hash does not contain #{input}."
end