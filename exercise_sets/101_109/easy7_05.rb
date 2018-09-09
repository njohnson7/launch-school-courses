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
puts


# Alternate solution:
def staggered_case(str)
  str.chars.map.with_index do |c, idx|
    if idx.even? then c.upcase
    else c.downcase
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
puts


# Book solution:
def staggered_case(str)
  result = ''
  need_upper = true
  str.chars.each do |c|
    if need_upper then result += c.upcase
    else result += c.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
puts


# Modify this method so the caller can request that the first character be
#  downcased rather than upcase? If the first character is downcased, then the
#  second character should be upcased, and so on.

# Hint: Use a keyword argument.


def staggered_case(str, first_char: 'upcase')
  result = str.chars.map.with_index do |c, idx|
    if idx.even? then c.upcase
    else c.downcase
    end
  end.join
  first_char == 'downcase' ? result.swapcase : result
end

p staggered_case('I Love Launch School!', first_char: 'downcase')
p staggered_case('ALL_CAPS', first_char: 'downcase')
p staggered_case('ignore 77 the 444 numbers', first_char: 'downcase')
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', first_char: 'upcase') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
