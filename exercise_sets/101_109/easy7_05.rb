# easy7_05.rb
# Staggered Caps 1

# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count as
# characters when switching between upper and lowercase.

def staggered_case(str)
  chars = str.chars
  cap = true
  chars.map do |c|
    if c =~ /[a-zA-Z]/ && cap == true
      cap = false
      c.upcase
    elsif c =~ /[a-zA-Z]/ && cap == false
      cap = true
      c.downcase
    elsif cap == true
      cap = false
      c
    else
      cap = true
      c
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
