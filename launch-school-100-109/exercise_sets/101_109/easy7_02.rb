# easy7_02.rb
# Lettercase Counter

# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither.

def letter_case_count(str)
  letter_count = { lowercase: 0, uppercase: 0, neither: 0 }
  str.each_char do |c|
    if c =~ /[a-z]/ then letter_count[:lowercase] += 1
    elsif c =~ /[A-Z]/ then letter_count[:uppercase] += 1
    else letter_count[:neither] += 1
    end
  end
  letter_count
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }


# Book solution:
def letter_case_count(str)
  letter_count = {}
  chars = str.chars
  letter_count[:lowercase] = chars.count { |c| c =~ /[a-z]/ }
  letter_count[:uppercase] = chars.count { |c| c =~ /[A-Z]/ }
  letter_count[:neither] = chars.size - letter_count[:lowercase] -
                           letter_count[:uppercase]
  letter_count
end

p letter_case_count('abCdef 123') # { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') # { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') # { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') # { lowercase: 0, uppercase: 0, neither: 0 }
