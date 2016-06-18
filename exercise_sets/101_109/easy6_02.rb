# easy6_02.rb
# Delete vowels

# Write a method that takes an array of strings, and returns an array of the
#  same string values, except with the vowels (a, e, i, o, u) removed.

def remove_vowels(ary)
  ary.map { |str| str.delete('aeiouAEIOU') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #=> %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #=> %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #=> ['BC', '', 'XYZ']
puts


# Alternate solution:
def remove_vowels(ary)
  ary.map { |str| str.gsub(/[aeiou]/i, '') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #=> %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #=> %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #=> ['BC', '', 'XYZ']
puts


# Alternate solution 2:
def remove_vowels(ary)
  ary.each do |str|
    while str =~ (/[aeiou]/i)
      str.slice!(/[aeiou]/i)
    end
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #=> %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #=> %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #=> ['BC', '', 'XYZ']
