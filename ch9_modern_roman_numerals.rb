# ch9_modern_roman_nums.rb



def roman_numeral num
  roman_num = ""

  m = num / 1000
  roman_num << "M" * m

  d = num % 1000 / 500
  roman_num << "D" * d

  c = num % 1000 % 500 / 100
  roman_num << "C" * c

  l = num % 1000 % 500 % 100 / 50
  roman_num << "L" * l

  x = num % 1000 % 500 % 100 % 50 / 10
  roman_num << "X" * x

  v = num % 1000 % 500 % 100 % 50 % 10 / 5
  roman_num << "V" * v

  i = num % 1000 % 500 % 100 % 50 % 10 % 5 / 1
  roman_num << "I" * i

  roman_num.sub!("IIII", "IV")
  roman_num.sub!("VIV", "IX")

  roman_num.sub!("XXXX", "XL")
  roman_num.sub!("LXL", "XC")

  roman_num.sub!("CCCC", "CD")
  roman_num.sub!("DCD", "CM")

  puts "#{num} is #{roman_num} in Roman numeral format."
end

print "Please enter an integer between 1 and 3000: "
num = gets.chomp.to_i
roman_numeral num