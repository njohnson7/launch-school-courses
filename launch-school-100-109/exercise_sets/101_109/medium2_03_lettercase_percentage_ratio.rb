# medium2_03_lettercase_percentage_ratio.rb
# Lettercase Percentage Ratio

# In the easy exercises, we worked on a problem where we had to count the number
# of uppercase and lowercase characters, as well as characters that were neither
# of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the percentage of characters in the string that are
# lowercase letters, one the percentage of characters that are uppercase
# letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def count_letters(str)
  letter_count = { lowercase: 0, uppercase: 0, neither: 0 }
  str.each_char do |c|
    if c =~ /[a-z]/ then letter_count[:lowercase] += 1
    elsif c =~ /[A-Z]/ then letter_count[:uppercase] += 1
    else letter_count[:neither] += 1
    end
  end
  letter_count
end

def letter_percentages(str)
  letter_count = count_letters(str)
  letter_count.each do |type, count|
    percentage = count / str.size.to_f.round(3) * 100
    letter_count[type] = percentage % 1 == 0 ? percentage.to_i : percentage
  end
  letter_count
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
