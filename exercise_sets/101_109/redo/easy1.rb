# easy1.rb

# 1.  Repeat Yourself
def repeat(str, num)
  num.times { puts str }
end

repeat('Hello', 3)
puts



# 2.  Odd
def is_odd?(num)
  num.abs % 2 == 1
end


puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts



# 3.  List of Digits
def digit_list(num)
  num.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]
puts



# 4.  How Many?
def count_occurrences(arr)
  puts arr.uniq.map { |x| "#{x} => #{arr.count(x)}" }
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
            'motorcycle', 'car', 'truck']
count_occurrences(vehicles)
puts



# 5.  Reverse It (Part 1)
def reverse_sentence(str)
  str.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts



# 6.  Reverse It (Part 2)
def reverse_words(str)
  str.gsub(/\b([a-z]{5,})\b/i) { |word| word.reverse }
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
puts



# 7.  Stringy Strings
def stringy(num)
  "#{'10' * (num / 2)}#{1 if num.odd?}"
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts



# 8.  Array Average
def average(arr)
  arr.reduce(:+) / arr.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
puts



# 9.  Sum of Digits
def sum(num)
  num.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
puts

# Challenge - no basic looping constructs:
def sum(num)
  num.to_s.chars.reduce(0) { |s, n| s + n.to_i }
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
puts



# 10. What's my Bonus?
def calculate_bonus(num, bool)
  bool ? num / 2 : 0
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
