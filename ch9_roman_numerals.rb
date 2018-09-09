# ch9_roman_numerals.rb



def roman_numeral num
  raise "Must use positive integer" if num <= 0       # outputs error message if num <= 0

  old_roman_numeral = ""

  m = num / 1000
  old_roman_numeral << "M" * m

  d = num % 1000 / 500
  old_roman_numeral << "D" * d

  c = num % 1000 % 500 / 100
  old_roman_numeral << "C" * c

  l = num % 1000 % 500 % 100 / 50
  old_roman_numeral << "L" * l

  x = num % 1000 % 500 % 100 % 50 / 10
  old_roman_numeral << "X" * x

  v = num % 1000 % 500 % 100 % 50 % 10 / 5
  old_roman_numeral << "V" * v

  i = num % 1000 % 500 % 100 % 50 % 10 % 5 / 1
  old_roman_numeral << "I" * i

  puts "#{num} is #{old_roman_numeral} in old-school Roman numeral format."
end

print "Please enter an integer between 1 and 3000: "
num = gets.chomp.to_i
roman_numeral num