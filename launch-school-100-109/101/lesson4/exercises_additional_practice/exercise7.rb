# exercise7.rb

# Create a hash that expresses the frequency with which each letter occurs in
# this string:

statement = "The Flintstones Rock"

p statement.gsub(' ', '').chars.uniq.map { |c| [c, statement.count(c)] }.sort.to_h

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }



# solution 2:
p (statement.chars.sort.each_with_object(Hash.new(0)) do |char, hsh|
  hsh[char] += 1 if char[/[a-z]/i]
end)