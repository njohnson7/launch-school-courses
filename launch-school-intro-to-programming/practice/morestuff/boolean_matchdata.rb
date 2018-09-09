# boolean_matchdata.rb
# uses match method to perform regex comparison.
# match method returns a MatchData object that describes the object or nil if no match.
# MatchData object can act as a boolean value.



def has_a_b?(string)
  if /b/.match(string)
    puts "'#{string}' contains a 'b'."
  else
    puts "'#{string}' does not contain a 'b'."
  end
end

has_a_b?(gets.chomp)