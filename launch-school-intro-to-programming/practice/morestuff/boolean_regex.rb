# boolean_regex.rb
# uses =~ operator to match a regular expression against a string
#  =~ return value is an index number, which can be used as a boolean



def has_a_b?(string)
  if string =~ /b/
    puts "We have a match!"
  else
    puts "No match here."
  end
end

has_a_b?("basketball")
has_a_b?("football")
has_a_b?("hockey")
has_a_b?("golf")

has_a_b?(input = gets.chomp)