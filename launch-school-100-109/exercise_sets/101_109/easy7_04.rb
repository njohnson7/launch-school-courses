# easy7_04.rb
# Swap Case

# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be
# unchanged.

def swapcase(str)
  str.swapcase
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
puts


# Alternate solution:
def lowercase_to_uppercase
  lowercase = ('a'..'z').to_a
  uppercase = ('A'..'Z').to_a
  lowercase_to_uppercase = {}
  lowercase.each_with_index do |letter, idx|
    lowercase_to_uppercase[letter] = uppercase[idx]
  end
  lowercase_to_uppercase
end

def swapcase(str)
  lower_upper_lower = lowercase_to_uppercase.merge(lowercase_to_uppercase.invert)
  str.gsub(/[a-zA-Z]/, lower_upper_lower)
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
puts


# Book solution:
def swapcase(str)
  chars = str.chars
  chars.map do |c|
    if c =~ /[a-z]/ then c.upcase
    elsif c =~ /[A-Z]/ then c.downcase
    else c
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
