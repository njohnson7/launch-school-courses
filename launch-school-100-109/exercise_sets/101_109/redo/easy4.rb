# easy4.rb



puts '-------1--------'

# 1.    Short Long Short
def short_long_short(str1, str2)
  short, long = [str1, str2].sort_by(&:size)
  "#{short}#{long}#{short}"
end


p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"




puts
puts '-------2--------'

# 2.    What Century is That?
# SUFFIX = %w[th st nd rd th th th th th th th th th th th th th th th th]

def century(year)
  cent = year / 100
  cent += 1 unless year % 100 == 0
  tens = cent % 100
  suffix = if tens.between?(11, 14)
             'th'
           else
             case tens % 10
             when 1 then 'st'
             when 2 then 'nd'
             when 3 then 'rd'
             else 'th'
             end
           end
  "#{cent}#{suffix}"
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
p century(200) == '2nd'
p century(201) == '3rd'



puts
puts '-------3--------'

# 3.    Leap Years (Part 1)
def leap_year?(year)
  year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true





puts
puts '-------4--------'

# 4.    Leap Years (Part 2)
def leap_year?(year)
  year % 400 == 0 || (year % 4 == 0 && (year % 100 != 0 || year < 1752))
end


p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true







puts
puts '-------5--------'

# 5.    Multiples of 3 and 5
def multisum(num)
  (3..num).select { |n| n % 3 == 0 || n % 5 == 0 }.reduce(0, :+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
p multisum(2) == 0





puts
puts '-------6--------'

# 6.    Running Totals
def running_total(nums)
  nums.reduce([]) { |result, n| result << result.last.to_i + n }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []





puts
puts '-------7--------'

# 7.    Convert a String to a Number!
STR_TO_DIGITS = %w[0 1 2 3 4 5 6 7 8 9]

def string_to_integer(str)
  str.chars.reverse.map.with_index do |digit, idx|
    STR_TO_DIGITS.index(digit) * 10**idx
  end.reduce(0, :+)
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570




puts
puts '-------8--------'

# 8.    Convert a String to a Signed Number!
def string_to_signed_integer(str)
  sign, str = str[0], str[1..-1] if str.start_with?('-', '+')
  result = string_to_integer(str)
  sign == '-' ? result * -1 : result
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100



puts
puts '-------9--------'

# 9.    Convert a Number to a String!
def integer_to_string(num)
  return '0' if num.zero?
  digit = 1
  power = 0
  result = []
  while num > 0
    digit = num / 10**power % 10
    result << digit
    num -= digit * 10**power
    power += 1
  end
  result.reverse.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'



puts
puts '-------10--------'

# 10    Convert a Signed Number to a String!
def signed_integer_to_string(num)
  return '0' if num.zero?
  result = integer_to_string(num.abs)
  result.prepend(num.positive? ? '+' : '-')
end



p signed_integer_to_string(4321) #== '+4321'
p signed_integer_to_string(-123) #== '-123'
p signed_integer_to_string(0) #== '0'



