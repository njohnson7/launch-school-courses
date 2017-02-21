# 109_small_problems_new.rb



# repeat yourself:

def repeat(str, num)
  num.times { puts str }
end

def repeat(str, num)
  print "#{str}\n" * num
end

# repeat('Hello', 3)
# repeat('', 3)
# repeat('hi', 5)
# repeat('Hello', 0)




# odd

def is_odd?(num)
  num.abs % 2 == 1
end

def is_odd?(num)
  num.abs.remainder(2) == 1
end

# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)

def digit_list(num)
  num.to_s.chars.map(&:to_i)
end

def digit_list(num)
  digits = []
  while num > 0
    num, remainder = num.divmod(10)
    digits.unshift(remainder)
  end
  digits
end

# p digit_list(12345) #== [1, 2, 3, 4, 5]
# p digit_list(7) == [7]
# p digit_list(375290) == [3, 7, 5, 2, 9, 0]
# p digit_list(444) == [4, 4, 4]




def count_occurrences(vehicles)
  puts vehicles.uniq.map { |type| "#{type} => #{vehicles.count(type)}" }
end

def count_occurrences(vehicles)
  puts vehicles.each_with_object(Hash.new(0)) { |type, hsh| hsh["#{type} => "] += 1 }
               .to_a
               .map(&:join)
               .join("\n")
end

def count_occurrences(vehicles)
  puts vehicles.each_with_object(Hash.new(0)) { |type, hsh| hsh[type] += 1 }
               .to_s
               .delete('"{}')
               .gsub('=>', ' => ')
               .gsub(', ', "\n")
end


vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
            'motorcycle', 'car', 'truck']

# count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2




def reverse_sentence(str)
  str.split.reverse.join(' ')
end

# p reverse_sentence('') == ''
# p reverse_sentence('Hello World') == 'World Hello'
# p reverse_sentence('Reverse these words') == 'words these Reverse'




def reverse_words(str)
  str.gsub(/\w{5,}/, &:reverse)
end

# def reverse_words(str)
#   str.split.map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
# end

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

def stringy(n)
  ('10' * n)[0, n]
end

def stringy(n, zero = 1)
  ("#{zero == 1 ? '10' : '01' }" * n)[0, n]
end

# def stringy(n, zero = 1)
#   (0...n).map { |x| x.even? ? 1 : 0 }.join
# end

def stringy(n, zero = 1)
  (0...n).map { |x| (x + zero) % 2 }.join
end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
# puts stringy(7, 0)
# puts stringy(1, 0)

def average(nums)
  nums.reduce(:+).fdiv(nums.size)
end

# puts average([1, 5, 87, 45, 8, 8]) #== 25
# puts average([9, 47, 23, 95, 16, 52]) #== 40

def sum(num)
  num.to_s.chars.map(&:to_i).reduce(:+)
end

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45


def calculate_bonus(num, bool)
  bool ? num / 2 : 0
end

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000




def teddy_age
  puts "Teddy is #{rand(20..200)} years old!"
end

def teddy_age
  print 'Please enter name: '
  name = gets.chomp
  name = 'Teddy' if name.empty?
  puts "#{name} is #{rand(20..200)} years old!"
end

# teddy_age


def room
  puts 'Enter the length of the room in meters:'
  length = gets.to_f
  puts 'Enter the width of the room in meters:'
  width = gets.to_f
  area_meters = (length * width).round(2)
  area_feet = (area_meters * 10.7639).round(2)
  puts "The area of the room is #{area_meters} square meters (#{area_feet}"\
       " square feet)."
end

# room




def greet
  print 'What is your name?'
  name = gets.chomp
  put
end

# greet




def odds
  puts (1..99).step(2).to_a
end

def odds
  puts 1.step(by: 2, to: 99).to_a
end

# odds

def evens
  puts 2.step(98, 2).to_a
end

# evens



def multiply(a, b)
  a * b
end

# p multiply 1, 2

def powered(n, power)
  return 1 if power == 0
  start = n
  while power > 1
    n = multiply(start, n)
    power -= 1
  end
  n
end

def powered(n, power)
  return 1 if power == 0
  powered(multiply(1, n), power - 1) * n
end

def powered(n, power)
  ([n] * power).reduce(1) { |prod, x| multiply(prod, x) }
end

# p powered(3, 2)
# p powered(3, 3)
# p powered(3, 4)
# p powered(3, 5)
# p powered(3, 6)
# p powered(3, 7)
# p powered(2, 0)
# p powered(2, 1)
# p powered(2, 2)
# p powered(2, 3)
# p powered(2, 4)
# p powered(2, 5)
# p powered(0, 5)



def xor?(a, b)
  !a ^ !b
end

# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false
# p xor?(3, 1)
# p xor?(3, nil)
# p xor?('3', nil)
# p xor?('3', false)
# p xor?(nil, false)
# p xor?('3', 1)
# p xor?(5, true)





def oddities(arr)
  arr.select.with_index { |_, idx| idx.even? }
end

def oddities(arr)
  arr.each_slice(2).map { |a, b| a }
end

def oddities(arr)
  arr.partition.with_index { |_, idx| idx.odd? }.last
end

def oddities(arr)
  arr.reject.with_index { |_, idx| idx.odd? }
end

def oddities(arr)
  (0...arr.size).step(2).map { |idx| arr[idx] }
end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []
# p oddities([1, 2, 3])



def palindrome?(str)
  str == str.reverse
end

def palindrome?(obj)
  obj == obj.reverse
end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true
# p palindrome?([1,2,3,4,5]) == false
# p palindrome?([1,2,3,2,1]) == true



def real_palindrome?(str)
  palindrome?(str.downcase.delete('^a-z0-9'))
end

# p real_palindrome?('madam')# == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false




def palindromic_number?(num)
  palindrome?(num.to_s)
end

# p palindromic_number?(34543) == true
# p palindromic_number?(123210) == false
# p palindromic_number?(22) == true
# p palindromic_number?(5) == true
# p palindromic_number?(005)

def short_long_short(str1, str2)
  short, long = [str1, str2].sort_by(&:size)
  short + long + short
end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"


# get num from cent
  #
def century(year)
  cent = (year - 1) / 100 + 1
  suffix = if (cent % 100).between?(11, 13)
             'th'
           else
             case cent % 10
             when 1 then 'st'
             when 2 then 'nd'
             when 3 then 'rd'
             else 'th'
             end
           end
  cent.to_s + suffix
end

# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'
# puts
# p century(2101)
# p century(2201)
# p century(2301)
# p century(2401)
# p century(1001)
# p century(1101)
# p century(1201)
# p century(1301)
# p century(1401)


def leap_year?(year)
  (year >= 1752 && (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))) ||
    (year < 1752 && year % 4 == 0)
end

def leap_year?(year)
  year % 400 == 0 || (year % 4 == 0 && (year % 100 != 0 || year < 1752))
end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true


# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true




def multisum(num)
  (3..num).select { |n| (n % 3).zero? || (n % 5).zero? }.reduce(0, :+)
end

# def multisum(num)
#   (3..num).reduce(0) { |sum, n| n % 3 == 0 || n % 5 == 0 ? sum + n : sum }
# end

# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168
# p multisum(1)



def running_total(arr)
  arr.map.with_index { |n, idx| n + arr.take(idx).reduce(0, :+) }
end

def running_total(nums)
  nums.reduce([]) { |result, n| result += [result.last.to_i + n] }
end

def running_total(arr)
  arr.map.with_index(1) { |_, idx| arr.take(idx).reduce(:+) }
end

def running_total(arr)
  (1..arr.size).map { |amount| arr.take(amount).reduce(:+) }
end

# p running_total([2, 5, 13]) #== [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
# p running_total([3]) #== [3]
# p running_total([]) #== []



NUMS = %w[0 1 2 3 4 5 6 7 8 9]

def string_to_integer(str)
  str.chars.reverse_each.with_index.reduce(0) do |num, (digit, idx)|
    num + NUMS.index(digit) * 10**idx
  end
end

def string_to_integer(str)
  multipliers = (0...str.size).map { |power| 10**power }.reverse
  digits = str.chars.map { |digit| digit.ord - 48 }
  digits.zip(multipliers).map { |pair| pair.reduce(:*) }.reduce(:+)
end

# p string_to_integer('4321')# == 4321
# p string_to_integer('570') #== 570
# p string_to_integer('0')

HEX = %w[0 1 2 3 4 5 6 7 8 9 A B C D E F]

def hexadecimal_to_integer(str)
  str.upcase
     .chars
     .reverse_each
     .with_index
     .reduce(0) { |num, (digit, power)| num + HEX.index(digit) * 16**power }
end

# p hexadecimal_to_integer('4D9f') #== 19871



def string_to_signed_integer(str)
  string_to_integer(str[/\d+/]) * (str[/\A-/] ? -1 : 1)
end

def string_to_signed_integer(str)
  sign, str = str[0], str[1..-1] if str.start_with?('-', '+')
  result = string_to_integer(str)
  sign == '-' ? -result : result
end

# p string_to_signed_integer('4321') #== 4321
# p string_to_signed_integer('-570') #== -570
# p string_to_signed_integer('+100') #== 100


def integer_to_string(num)
  result = ''
  loop do
    num, remainder = num.divmod(10)
    result.prepend(NUMS[remainder])
    break if num <= 0
  end
  result
end

# def integer_to_string(num)
#   num.inspect
# end

# def integer_to_string(num)
#   [num].join
# end

# p integer_to_string(4321) #== '4321'
# p integer_to_string(0) #== '0'
# p integer_to_string(5000) #== '5000'
# p integer_to_string(-5000) #== '5000'





def signed_integer_to_string(num)
  integer_to_string(num.abs).prepend(['', '+', '-'][num <=> 0])
end

# p signed_integer_to_string(4321) #== '+4321'
# p signed_integer_to_string(-123) #== '-123'
# p signed_integer_to_string(0)# == '0'



def ascii_value(str)
  str.sum
end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') #== 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

def time_of_day(mins)
  format('%02d:%02d', *(mins % 1440).divmod(60))
end

def time_of_day(mins)
  (Time.new(2017, 2, 5) + mins * 60).strftime('%A %H:%M')
end

# p time_of_day(0) #== "00:00"
# p time_of_day(-3) #== "23:57"
# p time_of_day(35) #== "00:35"
# p time_of_day(-1437) #== "00:03"
# p time_of_day(3000) #== "02:00"
# p time_of_day(800) #== "13:20"
# p time_of_day(-4231) #== "01:29




def after_midnight(time)
  hours, mins = time.scan(/\d+/).map(&:to_i)
  (mins += hours * 60) % 1440
end

def before_midnight(time)
  (1440 - after_midnight(time)) % 1440
end

def after_midnight(time)
  ((Time.new(2000, 1, 1, *time.split(':')) - Time.new(2000, 1, 1)) / 60) % 1440
end


# p after_midnight('00:00')   #== 0
# p before_midnight('00:00')   #== 0
# p after_midnight('12:34')   #== 754
# p before_midnight('12:34')   #== 686
# p after_midnight('24:00')   #== 0
# p before_midnight('24:00')   #== 0



def swap(words)
  words.gsub(/(\w)(\w*)(\w)/, '\3\2\1')
end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'




def cleanup(str)
  str.gsub(/[^a-z]+/i, ' ')
end

def cleanup(str)
  str.chars.map { |c| ('a'..'z').member?(c.downcase) ? c : ' ' }.join.squeeze(' ')
end

def cleanup(str)
  str.tr_s('^a-zA-Z', ' ')
end


# p cleanup("---what's my +*& line?") == ' what s my line '
# p cleanup("---what's my +*& liASD das333sDne?")


def word_sizes(words)
  words.split.group_by(&:size).map { |size, count| [size, count.size] }.to_h
end

def word_sizes(words)
  words.split
       .map(&:size)
       .sort
       .chunk(&:itself)
       .map { |size, count| [size, count.size] }
       .to_h
end

def word_sizes(words)
  sizes = words.split.map(&:size)
  sizes.map { |size| [size, sizes.count(size)] }.to_h
end

# def word_sizes(words)
#   words.split.chunk(&:size).map { |size, count| [size, count.size] }#.to_h
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') ==
#   { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

def word_sizes(words)
  sizes = words.downcase.split.map { |word| word.count('a-z') }
  sizes.map { |size| [size, sizes.count(size)] }.to_h
end

def word_sizes(words)
  words.downcase
       .split
       .group_by { |word| word.count('a-z') }
       .map { |size, count| [size, count.size] }
       .to_h
end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}


ENGLISH_NUMS =
  %w[zero one two three four five six seven eight nine ten eleven twelve
     thirteen fourteen fifteen sixteen seventeen eighteen nineteen]

def alphabetic_number_sort(arr)
  arr.sort_by { |n| ENGLISH_NUMS[n] }
end

def alphabetic_number_sort(arr)
  arr.sort { |a, b| ENGLISH_NUMS[a] <=> ENGLISH_NUMS[b] }
end

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]




def crunch(str)
  str.squeeze
end

def crunch(str)
  str.tr_s(' -z', ' -z')
end

def crunch(str)
  str.gsub(/(.)\1+/, '\1')
end

def crunch(str)
  str.scan(/(.)(?!\1+)/).join
end

def crunch(str)
  str.chars.chunk(&:itself).map(&:first).join
end

def crunch(str)
  str.chars.select.with_index(1) { |char, idx| char != str[idx] }.join
end

def crunch(str)
  str.each_char.reduce('') { |res, char | char == res[-1] ? res : res + char }
end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''


def print_in_box(str)
  width = str.size + 2
  top_bot = "+#{'-' * width}+"
  padding = "|#{' ' * width}|"
  text = "| #{str} |"
  puts [top_bot, padding, text, padding, top_bot]
end

def print_in_box(str)
  lines = str.scan(/.{1,76}/)
  width = lines.first.to_s.size + 2
  top_bot = "+#{'-' * width}+"
  padding = "|#{' ' * width}|"
  text = lines.map { |line| "| #{line.ljust(width - 2)} |"}
  puts [top_bot, padding, *text, padding, top_bot]
end

# print_in_box('To boldly go where no one has gone before.')
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+

# print_in_box('')
# # +--+
# # |  |
# # |  |
# # |  |
# # +--+

# print_in_box('To boldly go where no one has gone beforewhat is this i dont even how can that be who is driving omg bear is drving!!!!!!!! what is it now! i am so confused holy moly!')
# print_in_box('To boldly go where no one has gone beforewasd asd asd asd asd asd a23w79dhy 279dh a2d ahj89j80a2 80a2u80 yu80802 ud0ahu8 a2u90-d a90dj0 njacioj a209 rhat is this i dont even how can that be who is driving omg bear is drving!!!!!!!! what is it now! i am so confused holy moly!')



def dms(angle)
  angle = angle % 360
  degrees, mins = angle.divmod(1)
  mins, secs = (mins * 60).divmod(1)
  secs *= 60
  format(%(%d°%02d'%02d"), degrees, mins, secs)
end

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°36'00")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# p dms(522.1238)
# p dms(-76.73)



def remove_vowels(arr)
  arr.map { |str| str.delete('AEIOUaeiou') }
end

def remove_vowels(arr)
  arr.map { |str| str.gsub(/[aeiou]/i, '') }
end

def remove_vowels(arr)
  arr.map { |str| str.tr('AEIOUaeiou', '') }
end

def remove_vowels(arr)
  arr.join("\n").gsub(/[aeiou]/i, '').split("\n")
end


# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


def find_fibonacci_index_by_length(length)
  a = b = 1
  idx = 1
  loop do
    return idx if a.to_s.size >= length
    a, b = b, a + b
    idx += 1
  end
end

def fib(n)
  return 1 if n == 1 || n == 2
  fib(n - 2) + fib(n - 1)
end

# p fib(1000)

# p find_fibonacci_index_by_length(2) == 7
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847
# p find_fibonacci_index_by_length(1)

def reverse!(list)
  half = list.size / 2 - 1
  0.upto(half) { |idx| list[idx], list[-(idx + 1)] = list[-(idx + 1)], list[idx] }
  list
end

def reverse!(list)
  list.each_with_index do |elem, idx|
    return list if idx >= list.size / 2
    list[idx], list[-(idx + 1)] = list[-(idx + 1)], list[idx]
  end
end

def reverse!(list)
  list.each_index { |idx| list.insert(idx, list.pop) }
end

def reverse!(list)
  copy_list = list.clone
  (list.size - 1).downto(0).with_index do |end_idx, start_idx|
    list[start_idx] = copy_list[end_idx]
  end
  list
end

def reverse!(arr)
  arr.sort_by!.with_index { |_, idx| -idx }
end

# list = [1,2,3,4]
# p result = reverse!(list) # => [4,3,2,1]
# p list == [4, 3, 2, 1]
# p list.object_id == result.object_id

# list = %w(a b c d e)
# p reverse!(list) # => ["e", "d", "c", "b", "a"]
# p list == ["e", "d", "c", "b", "a"]

# list = ['abc']
# p reverse!(list) # => ["abc"]
# p list == ["abc"]

# list = []
# p reverse!([]) # => []
# p list == []

def reverse(arr)
  arr.sort { |a, b| b <=> a }
end

def reverse(arr)
  arr.sort_by.with_index { |_, idx| -idx }
end

def reverse(arr)
  -1.downto(-arr.size).map { |idx| arr[idx] }
end

def reverse(arr)
  arr.reverse_each.with_object([]) { |elem, reversed| reversed << elem }
end

def reverse(arr)
  arr.map.with_index(1) { |_, idx| arr[-idx] }
end

def reverse(arr)
  (1..arr.size).reduce([]) { |reversed, idx| reversed += [arr[-idx]] }
end

def reverse(arr)
  (1..arr.size).each_with_object([]) { |idx, reversed| reversed << arr[-idx] }
end

# def reverse(arr)
#   arr.reduce([]) { |reversed, elem| reversed.unshift(elem) }
# end


# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# p list = [1, 2, 3]                      # => [1, 2, 3]
# p new_list = reverse(list)              # => [3, 2, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 2, 3]                     # => true
# p new_list == [3, 2, 1]                 # => true





def merge(arr1, arr2)
  arr1 | arr2
end

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

def merge(*arrs)
  arrs.flatten.uniq
end

def merge(arr1, arr2)
  [*arr1, *arr2].uniq
end

# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]



def halvsies(arr)
  half = arr.size.fdiv(2).ceil
  [arr.take(half), arr.drop(half)]
end

def halvsies(arr)
  half = arr.size.fdiv(2).ceil
  arr.partition.with_index { |_, idx| idx < half }
end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]



def find_dup(arr)
  arr.find { |elem| arr.count(elem) > 1 }
end

def find_dup(arr)
  arr.reduce([]) { |arr2, elem| arr2.include?(elem) ? (return elem) : arr2 << elem }
end

def find_dup(arr)
  arr.find { |elem| arr.index(elem) != arr.rindex(elem) }
end

def find_dup(arr)
  arr.sort.each_cons(2) { |a, b| return a if a == b }
end

def find_dup(arr)
  arr.sort.reduce { |memo, elem| memo == elem ? (return elem) : elem }
end

def find_dup(arr)
  arr.reject { |e| arr.count(e) == 1 }.first
end

# p find_dup([1, 5, 3, 1]) #== 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#             14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#             38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#             78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#             89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#             41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#             55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#             85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#             40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#             7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) #== 73





# def include?(arr, value)
#   arr.any? { |elem| elem == value }
# end

# def include?(arr, value)
#   arr.each { |elem| return true if elem == value }
#   false
# end

def include?(arr, value)
  arr.member?(value)
end

def include?(arr, value)
  !!arr.index(value)
end

# def include?(arr, value)
#   arr.count(value) > 0
# end

def include?(arr, value)
  !arr.none? { |elem| elem == value }
end

# def include?(arr, value)
#   !arr.select { |elem| elem == value }.empty?
# end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false



# normal:
def triangle(num)
  puts num.downto(1).map.with_index { |n, i| ' ' * i + '*' * n }.reverse
end

def triangle(num)
  puts (num - 1).downto(0).map.with_index(1) { |i, n| ' ' * i + '*' * n }
end

# upside down:
def triangle(num)
  puts num.downto(1).map.with_index { |n, i| ' ' * i + '*' * n }
end

# any corner:
def triangle(num, corner = :bot_right)
  triangle = num.downto(1).map.with_index { |n, i| [' '] * i + ['*'] * n }
  puts case corner
       when :top_left  then triangle.transpose.map(&:join).reverse
       when :top_right then triangle.map(&:join)
       when :bot_left  then triangle.transpose.map(&:join)
       else                 triangle.map(&:join).reverse
       end
end

# def triangle(num)
#   1.upto(num) { |n| puts ('*' * n).rjust(num) }
# end

# triangle(5)

# #     *
# #    **
# #   ***
# #  ****
# # *****

# triangle(9)

# #         *
# #        **
# #       ***
# #      ****
# #     *****
# #    ******
# #   *******
# #  ********
# # *********


# triangle(5, :top_left)
# triangle(5, :top_right)
# triangle(5, :bot_left)
# triangle(5, :bot_right)
# triangle(9)




def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

def interleave(arr1, arr2)
  arr1.each_with_index.reduce([]) { |result, (e, idx)| result + [e, arr2[idx]] }
end

def interleave(*arrs)
  arrs.transpose.flatten
end

def interleave(arr1, arr2)
  arr1.product(arr2).select.with_index { |_, idx| idx % (arr1.size + 1) == 0 }.flatten
end

def interleave(arr1, arr2)
  (0...arr1.size).flat_map { |idx| [arr1[idx], arr2[idx]] }
end

def interleave(arr1, arr2)
  product = arr1.product(arr2).each_slice(arr1.size).to_a
  (0...arr1.size).flat_map { |idx| product.dig(idx, idx) }
end

# p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']





def letter_case_count(str)
  counts = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z'}
  counts.map { |type, pattern| [type, str.count(pattern)] }.to_h
end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }



def word_cap(str)
  str.gsub(/\S+/, &:capitalize)
end

def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

# without using String#capitalize:
def word_cap(str)
  str.downcase.gsub(/(?<=\A|\s)\S/, &:upcase)
end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'



def swapcase(str)
  str.tr('A-Za-z', 'a-zA-Z')
end

def swapcase(str)
  str.gsub(/./) { |char| char[/[a-z]/] ? char.upcase : char.downcase }
end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
# p swapcase('Tonight on XYZ-T1231 e da2 Easd aV')





def staggered_case(str)
  str.gsub(/..?/, &:capitalize)
end

def staggered_case(str)
  str.scan(/..?/).map(&:capitalize).join
end

def staggered_case(str)
  str.chars.each_slice(2).map { |a, b| [a.upcase, b.to_s.downcase] }.join
end

# def staggered_case(str)
#   str.chars.map.with_index { |c, idx| idx.even? ? c.upcase : c.downcase }.join
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

def staggered_case(str, first = :upcase)
  second = first == :upcase ? :downcase : :upcase
  str.gsub(/..?/) { |pair| pair[0].send(first) + pair[1].to_s.send(second) }
end

# p staggered_case('I Love Launch School!')
# p staggered_case('I Love Launch School!', :downcase)
# p staggered_case('ALL_CAPS')
# p staggered_case('ALL_CAPS', :downcase)
# p staggered_case('ignore 77 the 444 numbers')
# p staggered_case('ignore 77 the 444 numbers', :downcase)
# puts


def staggered_case(str, first_upcase: true)
  start, str = first_upcase ? ['', str] : [str[0].downcase, str[1..-1]]
  start + str.gsub(/..?/, &:capitalize)
end

# p staggered_case('I Love Launch School!')
# p staggered_case('I Love Launch School!', first_upcase: false)
# p staggered_case('ALL_CAPS')
# p staggered_case('ALL_CAPS', first_upcase: false)
# p staggered_case('ignore 77 the 444 numbers')
# p staggered_case('ignore 77 the 444 numbers', first_upcase: false)


def staggered_case(str, first_upcase: true)
  str.gsub(/..?/) do |pair|
    first_upcase ? pair.capitalize : pair[0].downcase + pair[1].to_s.upcase
  end
end
# puts
# puts '------------'

# p staggered_case('I Love Launch School!')
# p staggered_case('I Love Launch School!', first_upcase: false)
# p staggered_case('ALL_CAPS')
# p staggered_case('ALL_CAPS', first_upcase: false)
# p staggered_case('ignore 77 the 444 numbers')
# p staggered_case('ignore 77 the 444 numbers', first_upcase: false)





def staggered_case(str, second_upcase = false)
  str.chars.map do |char|
    second_upcase = !second_upcase if char[/[a-z]/i]
    second_upcase ? char.upcase : char.downcase
  end.join
end

def staggered_case(str, first_lowercase = false)
  str.gsub(/[a-z]/i) do |char|
    first_lowercase = !first_lowercase
    first_lowercase ? char.upcase : char.downcase
  end
end

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
# p staggered_case('ignore 77 the 444 numbers', true)
# puts


# with 2 options:
#  1) choose whether first char is lowercase
#  2) choose whether to ignore non-alpha characters
def staggered_case(str, first_lowercase: false, ignore_non_alpha: false)
  str.chars.map do |char|
    next char unless (char[/[a-z]/i] && ignore_non_alpha) || !ignore_non_alpha
    first_lowercase = !first_lowercase
    first_lowercase ? char.upcase : char.downcase
  end.join
end

# p staggered_case('ignore 77 the 444 numbers', first_lowercase: true, ignore_non_alpha: true)
# p staggered_case('ignore 77 the 444 numbers', first_lowercase: true, ignore_non_alpha: false)
# p staggered_case('ignore 77 the 444 numbers', first_lowercase: false, ignore_non_alpha: true)
# p staggered_case('ignore 77 the 444 numbers', first_lowercase: false, ignore_non_alpha: false)


def show_multiplicative_average(nums)
  puts format('The result is %.3f', nums.reduce(1, :*).fdiv(nums.size))
end


# show_multiplicative_average([3, 5]) # The result is 7.500

# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # The result is 28361.667



def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |a, b| a * b }
end

def multiply_list(*arrs)
  arrs.transpose.map { |pair| pair.reduce(:*) }
end

def multiply_list(arr1, arr2) ; arr1.zip(arr2).map { |a, b| a * b } ; end

def multiply_list(arr1, arr2, res = [])
  (arr1 + [1]).zip(arr2) { |a, b| res.size == arr1.size ? (return res) : res << a * b }
end

# p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]



def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |a, b| a * b }.sort
end

def multiply_all_pairs(arr1, arr2)
  arr1.flat_map { |n1| arr2.map { |n2| n1 * n2 } }.sort
end

# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]





def penultimate(str)
  str.split[-2]
end

def penultimate(str)
  str[/\S+(?=\s+\S+$)/]
end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'
# p penultimate('these are the words of "the" "sentence"!')
# puts


# returns '' of str is empty or nil, and the middle two words separated by
#  a comma, if the number of words is even:
def middle_word(str)
  words = str.to_s.split
  middle_idx = words.size.fdiv(2)
  words[middle_idx.ceil - 1..middle_idx.floor].to_a.join(', ')
end

# p middle_word(nil)                                        # ''
# p middle_word('')                                         # ''
# p middle_word('one')                                      # 'one'
# p middle_word('last word')                                # 'last, word'
# p middle_word('last word cool')                           # 'word'
# p middle_word('Launch School is great!')                  # 'School, is'
# p middle_word('Launch School is great yo!')               # 'is'
# p middle_word('these are "words" of "the" "sentence"!')   # '"words", of'



def sum_of_sums(nums)
  (1..nums.size).reduce(0) { |sum, n| sum + nums.take(n).reduce(0, :+) }
end

def sum_of_sums(nums)
  nums.reverse.map.with_index(1) { |n, idx| n * idx }.reduce(0, :+)
end

def sum_of_sums(arr)
  arr.size.downto(1).reduce(0) { |sum, n| sum + arr[-n] * n }
end

def sum_of_sums(arr)
  return arr.first if arr.size == 1
  sum_of_sums(arr[0...-1]) + arr.reduce(:+)
end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3)# 36
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35





def madlib
  noun, verb, adj, adv = %w[noun verb adjective adverb].map do |word_type|
    puts "Please enter a#{'n' if word_type[/\Aa/]} #{word_type}:"
    gets.chomp
  end
  puts format("Do you %s your %s %s %s? That's hilarious!", verb, adj, noun, adv)
end

# madlib




def substrings_at_start(str)
  (1..str.size).map { |amount| str[0, amount] }
end

def substrings_at_start(str)
  str.size <= 1 ? [str] : [*substrings_at_start(str.chop), str]
end

# p substrings_at_start('abc') == ['a', 'ab', 'abc']
# p substrings_at_start('a') == ['a']
# p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
# p substrings_at_start('')





def substrings(str)
  (0...str.size).flat_map { |n| substrings_at_start(str[n..-1]) }
end

def substrings(str)
  str.size <= 1 ? [str] : [*substrings_at_start(str), *substrings(str[1..-1])]
end

def substrings(str)
  str.size <= 1 ? [str] : substrings_at_start(str) + substrings(str[1..-1])
end

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]


def palindromes(str)
  substrings(str).select { |s| s.size > 1 && s == s.reverse }
end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#    'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#    'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#    '-madam-', 'madam', 'ada', 'oo'
#  ]
# p palindromes('knitting cassettes') == [
#    'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
#  ]



# ignores non-alphanumeric characters and letter case for selection,
#  returning palindromic substrings, with non-alphanumeric characters
#  removed, but preserving letter case:
def palindromes(str)
  substrings(str.delete('^A-Za-z0-9')).select do |s|
    s.size > 1 && s.downcase == s.reverse.downcase
  end
end

# p palindromes('abcd') #== []
# p palindromes('madam') #== ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') #== [
#  #   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#  #   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#  #   '-madam-', 'madam', 'ada', 'oo'
#  # ]
# p palindromes('knitting cassettes') #== [
#  #   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
#  # ]
#  p palindromes('knittinG cassettes CATAC CaTAC CaTaC')




def fizzbuzz(first, last)
  (first..last).map do |n|
    if n % 15 == 0    then 'FizzBuzz'
    elsif n % 5 == 0  then 'Buzz'
    elsif n % 3 == 0  then 'Fizz'
    else                   n
    end
  end.join(', ')
end

def fizzbuzz(first, last)
  first.upto(last).with_object('').map do |n, elem|
    elem =  'Fizz' if (n % 3).zero?
    elem += 'Buzz' if (n % 5).zero?
    elem.empty? ? n : elem
  end.join(', ')
end



# p fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz




def repeater(str)
  str.gsub(/./, '\0\0')
end

# def repeater(str)
#   str.chars.map { |c| c * 2 }.join
# end

def repeater(str)
  Array.new(2, str.chars).transpose.join
end

def repeater(str)
  [str.chars, str.chars].transpose.join
end

# def repeater(str)
#   str.chars.zip(str.chars).join
# end

def repeater(str)
  str.gsub(/./) { |c| c * 2 }
end

def repeater(str)
  str.chars.reduce('') { |result, char| result + char + char }
end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''


def double_consonants(str)
  str.gsub(/[b-z&&[^eiou]]/i, '\0\0')
end


# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""




def reversed_number(n) n.to_s.reverse.to_i end

define_method(:reversed_number) { |n| n.to_s.reverse.to_i }

def reversed_number(num)
  result = 0
  until num == 0
    num, remainder = num.divmod(10)
    result = result * 10 + remainder
  end
  result
end

def reversed_number(num)
  ([10] * num).reduce(0) do |result, ten|
    num, remainder = num.divmod(ten)
    num == 0 ? (return result * 10 + remainder) : result * 10 + remainder
  end
end

def reversed_number(num)
  size = (1..100).find { |n| num / 10**n == 0 }
  digits = (1..size).map { (num, _ = num.divmod(10)).last }.reverse
  digits.map.with_index { |digit, idx| digit * 10**idx }.reduce(:+)
end


def reversed_number(num)
  size = (1..100).find { |n| num / 10**n == 0 }
  (1..size).reduce([]) do |arr, n|
    arr << (num, _ = num.divmod(10)).last
    arr.map { |x| x * 10 }
  end.reduce(:+)
  # digits.map.with_index { |digit, idx| digit * 10**idx }.reduce(:+)
end

def reversed_number(num)
  size = (1..100).find { |n| num / 10**n == 0 }
  (1..size).reduce(0) do |result, n|
    num, remainder = num.divmod(10)
    result * 10 + remainder
  end
end


# def reversed_number(num)
#   max_power = (1..100).find { |x| num / 10**x == 0 } - 1
#   max_power = (1..100).find { |x| num / 10**x == 0 } - 1
#   max_power.downto(0).map { |power| (num, _ = num.divmod(10)).last**power }
# end


# def reversed_number(num)
#   max_power = (1..100).find { |power| num / 10**power == 0 } - 1
#   powers = max_power.downto(0).map { |power| 10**power }
#   digits = (1..100).map { (num, _ = num.divmod(10)).last }
#   digits.zip(powers).map { |digit, power| digit * power.to_i }.reduce(:+)
# end

def reversed_number(num, rem = 0)
  return rem if num == 0
  rem = rem * 10 + (num % 10)
  reversed_number(num / 10, rem)
end

def reversed_number(num, result = 0)
  return result if num == 0
  num, rem = num.divmod(10)
  result = result * 10 + rem
  reversed_number(num, result)
end

def reversed_number(n)
  n.zero? ? 0 : (n % 10) * 10**Math.log10(n).to_i + reversed_number(n / 10)
end

# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # Note that zeros get dropped!
# p reversed_number(1) == 1
# p reversed_number(101) == 101
# p reversed_number(1010567) == 7650101


def center_of(str)
  str[str.size.fdiv(2).ceil - 1..str.size.fdiv(2).floor]
end

define_method(:center_of) { |s| s[s.size.fdiv(2).ceil - 1..s.size / 2] }

# p center_of('I love ruby') == 'e'
# p center_of('Launch School') == ' '
# p center_of('Launch') == 'un'
# p center_of('Launchh') == 'n'
# p center_of('Launchschool') == 'hs'
# p center_of('x') == 'x'





# def greetings(name, job)
#   "Hello, #{name.join(' ')}! Nice to have a #{job.values.join(' ')} around."
# end

def greetings(name, job)
  format('Hello, %s %s %s! Nice to have a %s %s around.', *name, *job.values)
end



# puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.




def twice(num)
  num.to_s[/\A(\d+)\1\z/] ? num : num * 2
end

def twice(num)
  half = num.to_s.size / 2
  num.to_s[0, half] == num.to_s[half..-1] ? num : num * 2
end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10




def negative(num)
  -num.abs
end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0      # There's no such thing as -0 in ruby




def sequence(num)
  (1..num).to_a
end

def sequence(num)
  [*1..num]
end

# accounts for negative numbers:
def sequence(num)
  num.positive? ? [*1..num] : [*num..1]
end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]
# p sequence(0)
# p sequence(-1)
# p sequence(-5)



def uppercase?(str)
  !str[/[a-z]/]
end

def uppercase?(str)
  str.chars.none? { |c| c[/[a-z]/] }
end

def uppercase?(str)
  str == str.upcase
end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true





def word_lengths(str)
  str.split.map { |word| "#{word} #{word.size}"}
end

# p word_lengths("cow sheep chicken") #== ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") #== ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# p word_lengths("") == []



def swap_name(name)
  name.split.reverse.join(', ')
end

def swap_name(name)
  name.sub(/(\w+) (\w+)/, '\2, \1')
end



# def swap_name(name)
#   name.match(/(\S+)(\S+)/)
# end

# p swap_name('Joe Roberts') #== 'Roberts, Joe'




def sequence(count, start)
  (1..count).map { |n| start * n }
end

def sequence(count, start)
  ([start] * count).map.with_index(1) { |n, i| n * i }
end

def sequence(count, start)
  start.step(by: start).take(count)
end

# recursive:
def sequence(count, start, num = start)
  count.positive? ? [num] + sequence(count - 1, start, start + num) : []
end

# p sequence(5, 1) #== [1, 2, 3, 4, 5]
# p sequence(4, -7) #== [-7, -14, -21, -28]
# p sequence(3, 0) #== [0, 0, 0]
# p sequence(0, 1000000) #== []





GRADES = { A: 90..1000, B: 80...90, C: 70...80, D: 60...70, F: 0...60 }
def get_grade(*scores)
  GRADES.find { |k, v| v.cover?(scores.reduce(:+).fdiv(scores.size)) }.first.to_s
end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"
# p get_grade(50, 50, 95, 70)
# p get_grade(50, 50, 95, 70, 90, 90)
# p get_grade(50, 50, 95, 70, 90, 90, 125, 500, 980)



def buy_fruit(fruits)
  fruits.flat_map { |fruit, amount| [fruit] * amount }
end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]




# works even with empty arrays:
def rotate_array(arr)
  [*arr[1..-1], *arr.first]
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true


def rotate_str(str)
  rotate_array(str.chars).join
end

def rotate_num(num)
  rotate_array(num.to_s.chars).join.to_i
end

# p rotate_str('12345')
# p rotate_str('abc')
# p rotate_str('a')
# p rotate_num(12345)
# p rotate_num(1)



def rotate_rightmost_digits(num, n)
  digits = num.to_s.chars
  amount = digits.size - n
  (digits.take(amount) + rotate_array(digits.drop(amount))).join.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917
# p rotate_rightmost_digits(735291, 0)





def max_rotation(num)
  num.to_s.size.downto(2) { |n| num = rotate_rightmost_digits(num, n) }
  num
end


def max_rotation(num)
  num.to_s.size.downto(2).reduce(num) { |nm, n| rotate_rightmost_digits(nm, n) }
end

def max_rotation(num, n = num.to_s.size)
  return num if n == 1
  num = rotate_rightmost_digits(num, n)
  max_rotation(num, n - 1)
end

# recursive:
def max_rotation(num, n = num.to_s.size)
  n <= 1 ? num : max_rotation(rotate_rightmost_digits(num, n), n - 1)
end

# def max_rotation(num)
#   num = num.to_s
#   (0...num.size).each { |n| num[n..-1] = num[n + 1..-1] + num[n] }
#   num.to_i
# end

# without using previous methods:
def max_rotation(x)
  (0...x.to_s.size).reduce(x.to_s) { |x, n| x[0...n] + x[n + 1..-1] + x[n] }.to_i
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15  #the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845




# input: num
# output: two nums from (1..num) that product == (1..num).reduce(:+) - a - b
    # in arr form
# algorithm:
  # nums = (1..num).to_a
  # possible_nums = nums.combination(2)
  # sum = nums.reduce(:+)
  # iterate thru each possible num combo and check if product of a, b == sum - a - b
  # return true


def remove_nb(num)
  nums = (1..num).to_a
  sum = nums.reduce(:+)
  possible_nums = nums.combination(2)
  result = possible_nums.find do |a, b|
    a * b == sum - a - b
  end
  [result, result.reverse]
end

# p remove_nb(26)
# p remove_nb(100)


def removNb(n)
  nums = (1..n).to_a
  sum = nums.reduce(0, :+)
  low = sum / n
  result = []
  nums = (low..n).to_a
  half_idx = nums.size / 2
  small, big = nums[0...half_idx], nums[half_idx..-1]
  small.each do |s|
    big.each do |b|
      prod = s * b
      if prod > sum
        break
      elsif prod == (sum - s - b)
        result << [s, b] << [b, s]
      end
    end
  end
  result
end



# Given two arrays a and b write a function comp(a, b) (compSame(a, b) in
# Clojure) that checks whether the two arrays
# have the "same" elements, with the same multiplicities. "Same" means, here,
# that the elements in b are the elements
# in a squared, regardless of the order.

# Examples

# Valid arrays

# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

# comp(a, b) returns true because in b 121 is the square of 11, 14641 is the
# square of 121, 20736 the square of 144, 361
# the square of 19, 25921 the square of 161, and so on. It gets obvious if we
# write b's elements in terms of squares:

# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]



def comp(a, b)
  a.map(&:abs2).sort == b.sort
end


# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
# p comp(a, b)



# Write a function that takes in a string of one or more words, and returns
#the same string,
# but with all five or more letter words reversed (Just like the name of this
# Kata).
# Strings passed in will consist of only letters and spaces. Spaces will be
# included only when more than one word is present.


def spinWords(str)
  str.gsub(/(\w){5,}/, &:reverse)
end


# p spinWords( "Hey fellow warriors" )     =="Hey wollef sroirraw"
# p spinWords( "This is a test")     =="This is a test"
# p spinWords( "This is another test" )    =="This is rehtona test"



# In a factory a printer prints labels for boxes. For one kind of boxes the
# printer has to use colors which,  for the sake of simplicity, are named with
# letters from a to m.

# The colors used by the printer are recorded in a control string.  For example
# a "good" control string would be aaabbbbhaijjjm meaning that the printer used
# three times color a,  four times color b, then one time color a...

# Sometimes there are problems: lack of colors, technical malfunction and a
# "bad" control string is produced e.g. aaaxbbbbyyhwawiwjjjwwm.

# You have to write a function printer_error which given a string will output
# the error rate of the printer as a  string representing a rational whose
# numerator is the number of errors and the denominator the length of the
# control string.  Don't reduce this fraction to a simpler expression.

# The string has a length greater or equal to one and contains only letters from
# ato z.

def error_printer(str)
  "#{str.count('n-z')}/#{str.size}"
end



def list_squared(m, n)
  sums = []
  nums = (m..n).select do |num|
    sum = sqd?(num)
    sums << sum
    sum
  end
  nums.zip(sums.compact)
end


def sqd?(num)
  divisors = []
  (1..Math.sqrt(num)).each do |n|
    if num % n == 0
      divisor2 = num / n
      divisors << n << divisor2
    end
  end

  # (1..num).each do |n|
  #   divisors << n if num % n == 0
  # end
  sum_div_sq = divisors.uniq.map(&:abs2).reduce(:+)
  Math.sqrt(sum_div_sq) % 1 == 0 ? sum_div_sq : nil
end

# s = "aaabbbbhaijjjm"
# p error_printer(s) #=> "0/14"

# s = "aaaxbbbbyyhwawiwjjjwwm"
# p error_printer(s) #=> "8/22"


# no edge cases in algorithm
# good testing
#   p w/ each idx + elem
#   loop and then break after first time
# max works same as sort (alphabetical) <=>

# first longest:  a.max_by(&:size).size    -> arr.find { |x| x.size == x }

# longest =   in wrong location

# each_cons?


def longest_consec(given_array, num)
  return '' if num <= 0 || num > given_array.size
  concated_strings = []
  index = 0

  loop do
    concated_strings << given_array[index, num].join
    index += 1
    # break if concated_strings.size == given_array.size - 1
    break if index >= given_array.size - num + 1
  end
  # p concated_strings

  concated_strings.sort_by! do |word|
    word.size
  end

    longest = concated_strings.last.size

  final_array = concated_strings.select do |word|
    word.size >= longest ? word : false
  end

  final_array[0]

  # given_array.each_with_index do |word, idx|
  #   p given_array[idx]
  # end
end

def longest_consec(arr, k)
  k.between?(1, arr.size) ? arr.each_cons(k).map(&:join).max_by(&:size) : ''
end

# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) # --> "abigailtheta"

# n being the length of the string array, if n = 0 or k > n or k <= 0 return "".


# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2)   # "abigailtheta"
# p longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1) # "oocccffuucccjjjkkkjyyyeehh"
# p longest_consec([], 3)   # ""
# p longest_consec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2)   # "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
# p longest_consec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2)
# # # "wlwsasphmxxowiaxujylentrklctozmymu"
# p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], -2)   # ""
# p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3)   # "ixoyx3452zzzzzzzzzzzz"
# p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15)   # ""
# p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0)   # ""


# input: arr of lights [all false for off]
# output: arr of lights that are on (true)
# rules:
  # toggle certain lights on/off lights.size times
  # each time, turn on switches that are multiples of iteration + 1
# algorithm:
  # lights = Array.new(num_lights, false)
  # (1..lights.size) { |time| lights.map!.with_index(1) { |light, idx| !light if idx % time == 0}
  # return lights.map.with_index(1) { |light, idx| light ? idx : nil }.compact


def toggle_lights(num)
  lights = Array.new(num, false)
  (1..lights.size).each do |time|
    lights.map!.with_index(1) { |light, idx| idx % time == 0 ? !light : light }
  end
  lights.map.with_index(1) { |light, idx| idx if light }.compact
end

def toggle_lights(num)
  (1..num**0.5).map(&:abs2)
end


# p toggle_lights(0)
# p toggle_lights(1)
# p toggle_lights(2)
# p toggle_lights(5)
# p toggle_lights(10)
# p toggle_lights(100)
# p toggle_lights(1000)



def isTriangleNumber(number)
  number.is_a?(Integer) ? (Math.sqrt(1 + 8 * number)) % 1 == 0 : false
end
# p isTriangleNumber(6)
# p isTriangleNumber(28)
# p isTriangleNumber(10)
# p isTriangleNumber(11)




def reverse_odd_words(str)
  str.gsub(/(\w+) +(\w+)/) { $1 + ' ' + $2.reverse }.squeeze(' ').delete('.').strip + '.'
end

# p reverse_odd_words('whats the matter with kansas.')
# p reverse_odd_words('whats the matter with kansas yo.')
# p reverse_odd_words('whats    the   matter with      kansas  yo.  ')
# puts

# p reverse_odd_words('hello.')               # 'hello.'
# p reverse_odd_words('hello .')              # 'hello.'
# p reverse_odd_words('hello world.')         # 'hello dlrow.'
# p reverse_odd_words('hello world .')        # 'hello dlrow.'
# p reverse_odd_words('hello  world .')       # 'hello dlrow.'
# p reverse_odd_words('hello  hello world.')  # 'hello olleh world.'

# p reverse_odd_words('')                     # '.'


# input: number of lines
# output: diamond printed out
# rules:
  # lines: (1..n)
    # stars: 1, ... n - 2, n, n - 2,...  1
    # append spaces: n/2 -1, n/2 - 2, ... 0, ... n/2 -2, n/2-1
# DS: array of n lines
# algorithm:
  # middle line: '*' * n
  # next lines, til end: ' ' * line_num  + '*' * (n - 2, until 1)
  # puts next_lines.reverse + mid + next_lines

def diamond(num)
  half = num / 2 + 1
  middle = '*' * num
  lines = (1...num).step(2).map.with_index(1) { |n, i| (' ' * (half - i)) + ('*' * n) }
  puts [lines, middle, lines.reverse]
end

def diamond(n)
  top_rows = (1..n).step(2).map { |row| "#{'*' * row}".center(n) }
  bottom_rows = rows[0, n / 2].reverse
  puts top_rows + bottom_rows
end


def diamond(n)
  rows = (1..n).step(2).map { |row| "#{'*' * row}".center(n) }
  puts [rows, rows[0, n / 2].reverse]
end

def diamond(n)
  row_nums = ((1...n).to_a + n.downto(1).to_a).select(&:odd?)
  row_nums.each { |num| puts ('*' * num).center(n) }
end

def diamond(n)
  [*(1...n), *n.downto(1)].each { |i| puts ('*' * i).center(n) if i.odd? }
end

# outline only:
def diamond(n)
  rows = [*(1...n), *n.downto(1)].select(&:odd?)
  puts rows.map { |i| ('*' * i).gsub(/\*(\*+)\*/) { "*#{' ' * $1.size}*" }.center(n) }
end

# diamond(1)
# puts
# # *

# diamond(3)
# puts

# #  *
# # ***
# #  *

# diamond(9)
# puts

# #     *
# #    ***
# #   *****
# #  *******
# # *********
# #  *******
# #   *****
# #    ***
# #     *


# def multiply(a, b)
#   a * b
# end

# p multiply(3, 4) # 12 will be printed out when you run the program
# p multiply(5, 10) # 50 will be printed out


# def multiply(a, b)
#   p a
#   p b
#   a * b
# end

# p multiply(3, 4)
# # output:
# # 3
# # 4
# # 12

# p multiply(5, 10)
# # output:
# # 5
# # 10
# # 50






def minilang(str)
  register = 0
  stack = []
  str.split.each do |command|
    if command[/\A[+-]\d+\z/]
      register = command.to_i
    else
      case command
      when 'PRINT' then puts register
      when 'PUSH'  then stack << register
      when 'POP'   then register = stack.pop
      when 'ADD'   then register += stack.pop
      when 'SUB'   then register -= stack.pop
      when 'MULT'  then register *= stack.pop
      when 'DIV'   then register /= stack.pop
      when 'MOD'   then register %= stack.pop
      else              'Error: Invalid command.'
      end
    end
  end
end


# minilang('PRINT')
# puts
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15
# puts

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8
# puts

# minilang('5 PUSH POP PRINT')
# puts
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# puts
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# puts
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# puts
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# puts
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)

# minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')




def balancer(str)
  count = 0
  str.delete('^()').each_char do |char|
    count += char == '(' ? 1 : -1
    return false if count.negative?
  end
  count == 0
end

def balancer(str)
  str.delete!('^()')
  str.gsub!('()', '') while str['()']
  str.empty?
end


def balancer(str)
  str.delete!('^()')
  return true if str.size == 0
  return false unless str['()']
  balancer(str.gsub('()', ''))
end


# p balancer('hi')
# p balancer('(hi')
# p balancer('(hi)')
# p balancer(')hi(')
# p balancer('(())hi()')
# p balancer('())hi()')





regex = /(?=.*[a-z]+)(?=.*[A-Z]+)(?=.*[0-9]+)(?=.*[!#£$@]+)^.{8,12}$/





def find_primes(a, b)
  (a..b).select { |n| prime?(n) }
end

def prime?(num)
  num > 1 ? (2..(num**0.5).floor).none? { |n| (num % n).zero? } : false
end

def prime?(num)
  (2..(num**0.5).floor).none? { |n| (num % n).zero? } if num > 1
end

# p find_primes(3, 10)
# p find_primes(5, 20)
# p find_primes(1, 20)
# p find_primes(1, 1)
# p find_primes(-100, 100)
# p find_primes(1, 2)




DIGITS = %w[zero one two three four five six seven eight nine]
def word_to_digit(str)
  str.gsub(/\w+/) { |word| DIGITS.include?(word) ? DIGITS.index(word) : word }
end

def word_to_digit(str)
  str.gsub(/\w+/) { |word| DIGITS.index(word) || word }
end

# case insensitive and removes spaces in between inserted numbers
def word_to_digit(str)
  str.gsub(/\w+ ?/) { |w| DIGITS.index(w.downcase.strip) || ' ' + w }.squeeze(' ')
end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') #==
#  'Please call me at 5 5 5 1 2 3 4. Thanks.'
# p word_to_digit('one THREE five SiX Seven eighT NINE zero FOUR thREe')
# p word_to_digit('one THREE five SiX Seven eighT 6 8 23 193 1 2 zero 5 one four')
# # => '135678 6 8 23 193 1 2 0 5 14'
# p word_to_digit('one THREE five SiX freight none ten 11 zero 2 33 4  4')


def word_to_digit(str)
  str.gsub(/\w+/) { |w| DIGITS.index(w.downcase.strip) || w }
     .gsub(/(\d+ ?){10}/) do |n|
        n.delete!(' ')
        "(#{n[0, 3]}) #{n[3, 3]}-#{n[6, 4]} "
    end
end

# case insensitive, and removes spaces in between inserted numbers, and converts
#  any 10 consecutive digits to phone number format
def word_to_digit(str)
  str.gsub(/\w+ ?/) { |w| DIGITS.index(w.downcase.strip) || ' ' + w }
     .strip
     .squeeze(' ')
     .gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
end

# p word_to_digit('Please call me at six seven eight five five five one two three four. Thanks.')
# p word_to_digit('one two THREE four five SiX seven eight nine zero')
# p word_to_digit('one two THREE four five SiX seven eight nine zero 1 2 3')
# p word_to_digit('1 2 3 one two THREE four five SiX seven eight nine zero')
# p word_to_digit('1 2 3 one two THREE four five SiX 5 7 seven eight nine zero')
# p word_to_digit('1 2 3 one two THREE four five SiX 5 7 seven eight nine zero zero one two three four five six 1 2 3 four five six 7 89 10 zero one 3 one 3')




def fibonacci(n)
  n <= 2 ? 1 : fibonacci(n - 1) + fibonacci(n - 2)
end

def fibonacci(n, a = 1, b = 1)
  if    n <= 1 then a
  elsif n == 2 then b
  else              fibonacci(n - 1, b, a + b)
  end
end

def fibonacci(n)
  (3..n).reduce([1, 1]) { |(a, b), _| [b, a + b] }.last
end

def fibonacci(n)
  fib = Enumerator.new do |y|
    a = b = 1
    loop do
      y << a
      a, b = b, a + b
    end
  end
  fib.take(n).last
end

def fibonacci
  fib = Enumerator.new do |y|
    a = b = 1
    loop do
      y << a
      a, b = b, a + b
    end
  end
end

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765
# p fibonacci(9000)

# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501


def fibonacci_last(n)
  (3..n).reduce([1, 1]) { |(a, b), _| [b % 10, (a + b) % 10] }.last
end

# def fibonacci_last(n)
#   last_seq = []
#   (1..60).reduce([1, 1]) do |(a, b), _|
#     last_seq << a
#     [b % 10, (a + b) % 10]
#   end
#   last_seq[(n % 60) - 1]
# end

# def fibonacci_last(n)
#   a, b = 0, 1
#   last_seq = (1..60).map { a, b = [b % 10, (a + b) % 10] }
#   last_seq[(n % 60) - 1].first
# end

# def fibonacci_last(n, a = 0, b = 1)
#   (1..60).map { a, b = [b % 10, (a + b) % 10] }[(n % 60) - 1].first
# end

# stand-alone method that instantly calculates last digit of
#  123,456,789,987,745th+ fibonacci numbers:
def fibonacci_last(n)
  (1...n % 60).reduce([1, 1]) { |(a, b), _| [b % 10, (a + b) % 10] }.first
end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100) # 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4
# p fibonacci_last(123456789987745) # -> 5
# p fibonacci_last(10) # -> 5




def longest_sentence(file)
  text = File.read(file).gsub(/\s+/, ' ')
  sentences = text.scan(/\S.+?(?:\.|!|\?)/)
  longest = sentences.max_by { |sentence| sentence.split.size }
  word_count = longest.split.size
  [longest, word_count]
end

def longest_sentence(file)
  File.read(file)
      .gsub(/\s+/, ' ')
      .scan(/\S.+?(?:\.|!|\?)/)
      .map { |sentence| [sentence, sentence.split.size] }
      .max_by(&:last)
end

# includes proper punctuation at the end of the longest sentence, and removes
#  any whitespace characters besides a single space:
def longest_sentence(file)
  longest = File.read(file)
                .gsub(/\s+/, ' ')
                .scan(/\S.+?[.!?]/)
                .map { |sentence| [sentence, sentence.split.size] }
                .max_by(&:last)
  puts format("Longest sentence:\n%s\n\nWord count: %s", *longest)
end

# longest_sentence('text.txt')
# puts
# longest_sentence('pg84.txt')
# puts


def longest_word(file)
  File.read(file).scan(/\w+/).max_by(&:size)
end

# p longest_word('text.txt')
# puts
# p longest_word('pg84.txt')
# puts


def longest_paragraph(file)
  File.read(file).split(/\n\n/)
end

def longest_paragraph(file)
  text = File.read(file).delete("\r")
  paragraphs = text.split(/\n\n+/)
  longest = paragraphs.max_by { |p| p.split.size }
  num_of_sentences = longest.split(/\.|\?|!/).size
  [longest, num_of_sentences]
end

# p longest_paragraph('text.txt')
# puts
# p longest_paragraph('pg84.txt')




BLOCKS = %w[BO XK DQ CP NA GT RE FS JW HU VI LY ZM]
def block_word?(word)
  BLOCKS.none? { |block| word.upcase.count(block) > 1 }
end

def block_word?(w)
  %w[BO XK DQ CP NA GT RE FS JW HU VI LY ZM].none? { |b| w.upcase.count(b) > 1 }
end


# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true
# p block_word?('PANDA') == false
# p block_word?('FRUIT') == true
# p block_word?('BEAR') == false
# p block_word?('WYOMING') == true
# p block_word?('APRICOT') == false


def letter_percentages(str)
  %i[lowercase uppercase neither].zip(%w[a-z A-Z ^a-zA-Z]).map do |type, pat|
    [type, str.count(pat).fdiv(str.size) * 100]
  end.to_h
end

# def letter_percentages(str)
#   letter_case = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }
#   letter_case.map { |type, pat| [type, str.count(pat).fdiv(str.size) * 100 ] }.to_h
# end

# p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }





def balanced?(str)
  str.delete!('^()')
  str.gsub!('()', '') while str['()']
  str.empty?
end

def balanced?(str)
  balanced = str.scan(/\(|\)/).reduce(0) do |count, char|
    return false if count.negative?
    count + (char == '(' ? 1 : -1)
  end
  balanced.zero?
end

def balanced?(str)
  str.delete('^()').each_char.reduce(0) do |count, char|
    return false if count.negative?
    count + (char['('] ? 1 : -1)
  end.zero?
end

def balanced?(str)
  str.delete('^()')
     .each_char
     .reduce(0) { |s, c| s.negative? ? (return false) : s + (c['('] ? 1 : -1) }
     .zero?
end

# recursive:
def balanced?(str)
  str.delete!('^()')
  return true if str.empty?
  return false unless str['()']
  balanced?(str.gsub('()', ''))
end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false


# accounts for ()'s, []'s, {}'s, single quotes, double quotes, and apostrophes
#  within words
def balanced?(str)
  pattern = /\(\)|\[\]|\{\}|""|''/
  str.gsub!(/(?<=\w)'(?=\w)/, '')
  str.delete!('^()[]{}"\'')
  str.gsub!(pattern, '') while str[pattern]
  str.empty?
end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
# p balanced?('What [[is]]] up[') == false
# p balanced?('What {{is}}} up{') == false
# p balanced?('What (is) this?') == true
# p balanced?('What [is] this?') == true
# p balanced?('What {is} this?') == true
# p balanced?('What "is" this?') == true
# p balanced?('What "is" this?"') == false
# p balanced?("What 'is' this?") == true
# p balanced?("'What 'is' this?") == false
# p balanced?(%('what [is] {this [i] dont even} "know"')) == true
# p balanced?(%('what [is] {this [i] dont] even} "know"')) == false
# p balanced?(%('what [is] {this [i] don't even} "know"')) == true
# p balanced?(%('what [is] {this [i] don't] even} "know"')) == false
# p balanced?(%('what ['is'] {this [i] don't even} "know"')) == true
# p balanced?(%('what ['is'] {'this [i] don't even} "know"')) == false
# p balanced?(%('")) == false
# p balanced?(%('"")) == false
# p balanced?(%(''"")) == true
# p balanced?(%('""')) == true





def parse_nums(str)
  str.split.sort_by { |x| x.delete('^A-Za-z') }.map { |x| x.delete('^0-9').to_f }
end

def do_math(str)
  nums = parse_nums(str)
  current = nums.shift
  idx = 0
  loop do
    case idx
    when 0 then current += nums.shift
    when 1 then current -= nums.shift
    when 2 then current *= nums.shift
    when 3 then current /= nums.shift
    end
    idx += 1
    idx = 0 if idx > 3
    return current.round if nums.empty?
  end
end

# p do_math("24z6 1z23 y369 89z 900b")        #1414
# p do_math("24z6 1x23 y369 89a 900b")        #1299
# p do_math("10a 90x 14b 78u 45a 7b 34y")     #60
# p do_math("111a 222c 444y 777u 999a 888p")  #1459
# p do_math("1z 2t 3q 5x 6u 8a 7b")           #8


def triangle(*sides)
  return :invalid unless sides.min(2).reduce(:+) > sides.max && sides.all?(&:positive?)
  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  else        :scalene
  end
end

def triangle(*sides)
  return :invalid unless sides.all?(&:positive?) && sides.min(2).reduce(:+) > sides.max
  %i[equilateral isosceles scalene][sides.uniq.size - 1]
end

def triangle(*sides)
  sides = [] unless sides.all?(&:positive?) && sides.min(2).reduce(:+) > sides.max
  %i[invalid equilateral isosceles scalene][sides.uniq.size]
end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid
# p triangle(3, 3, -3) == :invalid




def triangle(*angles)
  angles = [] unless angles.all?(&:positive?) && angles.reduce(:+) == 180
  %i[invalid right obtuse acute][angles.count { |a| a < 90 } - angles.count { |a| a == 90 }]
end

# p triangle(60, 70, 50) == :acute
# p triangle(89, 2, 89) == :acute
# p triangle(60, 80, 40) == :acute
# p triangle(30, 90, 60) == :right
# p triangle(45, 45, 90) == :right
# p triangle(1, 90, 89) == :right
# p triangle(120, 50, 10) == :obtuse
# p triangle(91, 49, 40) == :obtuse
# p triangle(1, 2, 177) == :obtuse
# p triangle(0, 90, 90) == :invalid
# p triangle(50, 50, 50) == :invalid
# p triangle(60, 70, -50) == :invalid




require 'date'
def friday_13th?(year)
  current_date = Date.new(year, 1, 13)
  count = 0
  12.times do
    count += 1 if current_date.friday?
    current_date = current_date.next_month
  end
  count
end

def friday_13th?(year)
  (1..12).reduce(0) { |sum, m| Time.new(year, m, 13).friday? ? sum + 1 : sum }
end

def friday_13th?(year)
  (1..12).count { |m| Time.new(year, m, 13).friday? }
end

# p friday_13th?(2015)#  == 3
# p friday_13th?(1986)#  == 1
# p friday_13th?(2019)#  == 2


def lucky_days(year)
  (1..12).map { |m| Time.new(year, m, 7).strftime('%A') }
end

# p lucky_days(2015)
# p lucky_days(1986)
# p lucky_days(2019)


def second_last_day_month(year)
  days = (2..12).map { |m| (Time.new(year, m, 1) - 90_000).strftime('%A') }
  days + [(Time.new(year + 1, 1, 1) - 90_000).strftime('%A')]
end

def second_to_last_days_of_month(year)
  last_days = (2..12).map { |month| Date.new(year, month, 1) - 2 }
  last_days += [Date.new(year + 1, 1, 1) - 2]
  last_days.map { |day| (day).strftime('%A %m-%d') }.join(', ')
end
# p second_to_last_days_of_month(2015)
# p second_to_last_days_of_month(1986)
# p second_to_last_days_of_month(2000)
# p second_to_last_days_of_month(2050)
# p second_to_last_days_of_month(2016)
# p second_last_day_month(2015)
# p second_last_day_month(1986)
# p second_last_day_month(2019)





# ~4x faster than given solution for large numbers:
def featured(num)
  num += 1
  num += 1 until (num % 7).zero? && num.odd?
  num.step(9_876_543_202, 14).find { |n| !n.to_s[/(\d).*\1/] } ||
    "There is no possible number that fulfills those requirements."
end



# p featured(12) #== 21
# p featured(20) #== 21
# p featured(21) #== 35
# p featured(997) #== 1029
# p featured(1029) #== 1043
# p featured(999_999) #== 1_023_547
# p featured(999_999_987) #== 1_023_456_987
# p featured(9_876_543_200)
# p featured(1)
# p featured(7)

# p featured(9_999_999_999)
# -> There is no possible number that fulfills those requirements





def bubble_sort!(arr)
  n = arr.size
  loop do
    new_n = 0
    (1...n).each do |idx|
      next unless arr[idx - 1] > arr[idx]
      arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1]
      new_n = idx
    end
    return arr if new_n.zero?
    n = new_n
  end
end



def bubble_sort!(arr)
  loop until arr.each_cons(2).with_index.none? do |(a, b), i|
    arr[i], arr[i + 1] = b, a if a > b
  end
end

# array = [5, 3]
# p bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# p bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# p bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# nums = (1..100).map { |n| rand(1000) }
# p bubble_sort!(nums)
# p nums


def sum_square_difference(n)
  (1..n).reduce(:+)**2 - (1..n).map(&:abs2).reduce(:+)
end

# p sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150





def star(num)
  lines = (0...num / 2).map { |n| "#{('*' + ' ' * n) * 2}*".center(num) }
  puts [lines.reverse, '*' * num, lines]
end

def star(n)
  puts (-(n / 2)..n / 2).map { |d| d.zero? ? '*' * n : "#{('*' + ' ' * (d.abs - 1)) * 2}*".center(n) }
end

# star(7)
# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
# puts

# star(9)
# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *




matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matrix)
  matrix.first.zip(matrix[1], matrix.last)
end

# def transpose(matrix)
#   matrix.map.with_index do |row, idx|
#     idx
#   end
# end

def transpose(matrix)
  (0...matrix.size).map do |row_idx|
    (0...matrix.size).map { |column_idx| matrix[column_idx][row_idx] }
  end
end

def transpose(matrix)
  (0...matrix.size).map do |row_idx|
    (0...matrix.size).map { |column_idx| matrix.dig(column_idx, row_idx) }
  end
end

def transpose(matrix)
  (0..2).map { |idx1| (0..2).map { |idx2| matrix.dig(idx2, idx1) } }
end

# works for any size square matrix:
def transpose(matrix)
  matrix.first.zip(*matrix[1..-1])
end

def transpose(matrix)
  matrix.first.zip(*matrix.drop(1))
end

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
# p transpose([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]])
# m = [[1, 2, 3, 4, 5],
#      [1, 2, 3, 4, 5],
#      [1, 2, 3, 4, 5],
#      [1, 2, 3, 4, 5],
#      [1, 2, 3, 4, 5]]
#
# p transpose(m)

def transpose!(m)
  [[0, 1], [0, 2], [1, 2]].each { |x, y| m[x][y], m[y][x] = m[y][x], m[x][y] }
end

def transpose!(m)
  (0...m.size - 1).each do |x|
    (x + 1...m.size).each { |y| m[x][y], m[y][x] = m[y][x], m[x][y] }
  end
end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
# p transpose!(matrix)
# p matrix
# m = [[1, 2, 3, 4, 5],
#      [1, 2, 3, 4, 5],
#      [1, 2, 3, 4, 5],
#      [1, 2, 3, 4, 5],
#      [1, 2, 3, 4, 5]]

# transpose!(m)
# p m


def transpose(matrix)
  matrix.first.zip(*matrix.drop(1))
end

# p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]





def rotate90(matrix)
  matrix.transpose.map(&:reverse)
end

# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

# works for any degrees argument value, rounding to nearest lower 90 degree:
def rotate(matrix, degrees)
  (0...degrees / 90 % 4).reduce(matrix) { |m, _| m.transpose.map(&:reverse) }
end

# p rotate(matrix1, 90)
# p rotate(matrix1, 180)
# p rotate(matrix1, 270)
# p rotate(matrix1, 360)
# p rotate(matrix1, 720)
# p rotate(matrix1, 450)

# p rotate(matrix1, 90) == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p rotate(matrix2, 90) == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p rotate(matrix1, 180) == [[6, 9, 3], [2, 7, 4], [8, 5, 1]]
# p rotate(matrix2, 180) == [[8, 0, 1, 5], [2, 4, 7, 3]]
# p rotate(matrix1, 270) == [[8, 2, 6], [5, 7, 9], [1, 4, 3]]
# p rotate(matrix2, 270) == [[2, 8], [4, 0], [7, 1], [3, 5]]






# def permutations(arr)
#   size = (1..arr.size).reduce(:*)
#   amount = size / arr.size
#   result = Array.new(size) { [] }
#   loop do
#     arr.each_with_index do |elem, idx1|
#       amount.times { |idx2| result[idx1 * idx2] << elem }
#     end
#     break
#   end
#   result
# end

# def permutations(arr)
#   perm_size = (1..arr.size).reduce(:*)
#   result = []
#   until result.size == perm_size
#     arr = arr.shuffle while result.include?(arr)
#     result << arr
#   end
#   result
# end

def permutations(arr)
  perm_size = (1..arr.size).reduce(:*)
  (0...perm_size).reduce([]) do |perms, _|
    arr = arr.shuffle while perms.include?(arr)
    perms + [arr]
  end
end

# def permutations(arr)
#   size = (1..arr.size).reduce(:*)
#   amount = size / arr.size
#   result = Array.new(size) { [nil] * arr.size }
#   # arr.size.times do
#     # (0...size).each do |idx1|
#     (0...amount).each do |idx1|
#       arr.each_with_index do |elem, idx2|
#         current_idx = idx1 * idx2
#         result[current_idx][idx2] = elem
#       end
#     end
#   # end
#   result
# end

# def permutations(arr)
#   result = (0...arr.size).map { |n| rotate(arr, n) }
#   arr.size.times do |idx|
#     to_rotate = result.dup
#     to_rotate.each do |a|
#       skip = a[0..idx]
#       remaining = a[idx + 1..-1]
#       rotate_amount = remaining.size - 1

#       1.upto(rotate_amount) do |amount|
#         to_add = [*skip, *rotate(remaining, amount)]
#         result << to_add
#       end
#     end
#   end

#   result.sort
# end

def permutations(arr)
  perms = (0...arr.size).map { |n| rotate(arr, n) }

  (0...arr.size).each do |idx|
    to_rotate = perms.dup
    to_rotate.each do |sub_arr|
      skip = sub_arr[0..idx]
      remaining = sub_arr[idx + 1..-1]
      rotate_amount = remaining.size - 1

      1.upto(rotate_amount) do |n|
        to_add = [*skip, *rotate(remaining, n)]
        perms << to_add
      end
    end
  end
  perms.sort
end

def rotate(arr, n)
  [*arr[n..-1], *arr[0...n]]
end

# def permutations(arr)
#   return [arr] if arr.size == 1
#   result = []
#   arr.each_with_index do |elem, idx|
#     sub_arr = arr[0...idx] + arr[idx + 1..-1]
#     permutations(sub_arr).each { |perm| result << [elem] + perm }
#   end
#   result
# end

def permutations(arr)
  return [arr] if arr.size == 1
  arr.flat_map.with_index do |elem, idx|
    sub_arr = arr[0...idx] + arr[idx + 1..-1]
    permutations(sub_arr).map { |perm| [elem] + perm }
  end
end

# def permutations(arr)
#   return [arr] if arr.size == 1
#   arr.flat_map.with_index do |elem, idx|
#     permutations(arr[0...idx] + arr[idx + 1..-1]).map { |perm| [elem] + perm }
#   end
# end

# def permutations(arr, n = arr.size - 1)
#   if n == 0
#     return arr
#   end
#   (0..n).each do |idx|
#     permutations(arr, n - 1)
#     if (n - 1).odd?
#       arr[1], arr[n] = arr[n], arr[1]
#     else
#       arr[idx], arr[n] = arr[n], arr[idx]
#     end
#   end
# end

def permutations(arr, n = arr.size, result = [])
  if n == 1
    result << arr.dup
  else
    0.upto(n - 2) do |i|
      permutations(arr, n - 1, result)
      if n.even? then arr[i], arr[n - 1] = arr[n - 1], arr[i]
      else            arr[0], arr[n - 1] = arr[n - 1], arr[0]
      end
    end
    permutations(arr, n - 1, result)
  end
  result
end

# p permutations([2])
# # -> [[2]]
# p permutations([1, 2])
# # -> [[1, 2], [2, 1]]
# p permutations([1, 2, 3])
# # ->[ [1, 2, 3],
# #     [1, 3, 2],
# #     [2, 1, 3],
# #     [2, 3, 1],
# #     [3, 1, 2],
# #     [3, 2, 1] ]
# p permutations([1, 2, 3, 4])
# # -> [[1, 2, 3, 4], [1, 2, 4, 3], [1, 3, 2, 4],
# #     [1, 3, 4, 2], [1, 4, 2, 3], [1, 4, 3, 2],
# #     [2, 1, 3, 4], [2, 1, 4, 3], [2, 3, 1, 4],
# #     [2, 3, 4, 1], [2, 4, 1, 3], [2, 4, 3, 1],
# #     [3, 1, 2, 4], [3, 1, 4, 2], [3, 2, 1, 4],
# #     [3, 2, 4, 1], [3, 4, 1, 2], [3, 4, 2, 1],
# #     [4, 1, 2, 3], [4, 1, 3, 2], [4, 2, 1, 3],
# #     [4, 2, 3, 1], [4, 3, 1, 2], [4, 3, 2, 1]]
# p permutations([1, 2, 3]).sort == [1, 2, 3].permutation.sort
# p permutations([1, 2, 3, 4]).sort == [1, 2, 3, 4].permutation.sort
# p permutations([1, 2, 3, 4, 5]).sort == [1, 2, 3, 4, 5].permutation.sort
# p permutations([1, 2, 3, 4, 5]).uniq.size
# p permutations([1, 2, 3, 4, 5, 6]).uniq.size
# p permutations([1, 2, 3, 4, 5, 6, 7]).uniq.size
# p permutations([1, 2, 3, 4, 5, 6, 7, 8]).uniq.size



def is_prime?(num)
  return false if num <= 1
  (2...num).none? { |n| num % n == 0 }
end

def primes(num)
  (1..num).select { |n| prime?(n) }
end

# p is_prime?(3)
# p is_prime?(4)

# p primes(100)

def select_primes(arr)
  arr.select { |n| is_prime?(n) }
end

# p select_primes([1,2,3,4])
# p select_primes([4,6,8,10])


def count(arr)
  arr.count { |n| is_prime?(n) }
end

# p count([1,2,3,4])
# p count([4,6,8,10])





def sum_prod
  puts 'enter an integer > 0:'
  num = gets.to_i
  puts 'do you want (s)um or (p)roduct?'
  choice = gets.chomp.downcase
  if choice == 's'
    sum = (1..num).reduce(0, :+)
    puts 'the sum is: ' + sum.to_s
  elsif choice == 'p'
    product = (1..num).reduce(1, :*)
    puts 'the product is: ' + product.to_s
  else
    'invalid choice'
  end
end

# sum_prod


def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

def interleave(arr1, arr2)
  [arr1, arr2].transpose.flatten
end

def interleave(arr1, arr2)
  arr1.each_with_index.reduce([]) { |a, (x, i)| a << x << arr2[i] }
end

# p interleave([1, 2, 3], %w[a b c])



def substring(str, idx1, idx2 = idx1)
  # str[idx1, idx2 + 1]
  # idx2 ? str[idx1..idx2] : str[idx1]
  # idx2 ||= idx1
  str[idx1..idx2]
end

# p substring('honey', 0, 2)
# p substring('honey', 1, 2)
# p substring('honey', 3, 9)
# p substring('honey', 2)



def substrings(str)
  arr = []
  (0...str.size).each do |idx|
    (0...str.size).each { |idx2| arr << str[idx..idx2] }
  end
  arr.reject{ |x| x.size < 2 }
end


def substrings(str)
  (0...str.size - 1).flat_map do |idx1|
    (idx1 + 1...str.size).map { |idx2| str[idx1..idx2] }
  end
end

# def substrings(str)
#   (2..str.size).flat_map { |n| str.chars.each_cons(n).to_a.map(&:join) }
# end

# p substrings('band')
# p substrings('world')
# p substrings('ppop')
# p substrings('abcde')


def palindromes(str)
  substrings(str).select { |s| s == s.reverse }
end

# p palindromes('ppop')


def largest(str)
  palindromes(str).max_by(&:size)
end


# p largest('ppop')


NUMZ = {
  'zero' => 0,
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9,
  'ten' => 10,
  'plus'  => '+',
  'minus' => '-',
  'times' => '*',
  'divided' => '/'
}

def computer(str)
  eval(str.delete('by').gsub(/\w+/) { |w| NUMZ[w] || w })
end

def computer(str)
  words = str.gsub(/\w+/) { |w| NUMZ[w] || w }.split
  nums, ops = words.partition { |x| x[/\d/] }
  nums = nums.map(&:to_i)
  current = nums.shift
  until ops.empty?
    op = ops.shift
    op == '+' ? current += nums.shift : current -= nums.shift
  end
  current
end

def computer(str)
  words = str.delete('by').gsub(/\w+/) { |w| NUMZ[w] || w }.split
  current = words.shift.to_i
  until words.empty?
    op, num = words.shift(2)
    case op
    when '+' then current += num.to_i
    when '-' then current -= num.to_i
    when '*' then current *= num.to_i
    else          current /= num.to_i
    end
  end
  current
end

def computer(str)
  words = str.delete('by').gsub(/\w+/) { |w| NUMZ[w] || w }.split
  while idx = words.index { |w| w == '*' || w == '/' }
    num1, op, num2 = words.slice!(idx - 1, 3)
    x = op == '*' ? num1.to_i * num2.to_i : num1.to_i / num2.to_i
    words.insert(idx - 1, x)
  end

  while idx = words.index { |w| w == '+' || w == '-' }
    num1, op, num2 = words.slice!(idx - 1, 3)
    x = op == '+' ? num1.to_i + num2.to_i : num1.to_i - num2.to_i
    words.insert(idx - 1, x)
  end
  words.first
end

# p computer('two plus two') # 4
# p computer('seven minus six') # 1
# p computer('zero plus eight') # 8
# p computer('two plus two minus three') # 1
# p computer('three minus one plus five minus four plus six plus ten minus four') # 15
# p computer('three minus one plus five minus 4 plus six plus 10 minus 4') # 15
# puts
# p computer('eight times four plus six divided by two minus two') # 17 || 33?
# p computer('one plus four times two minus two') # 8 || 7?
# p computer('nine divided by three times six') # 18 || 18?
# p computer('five times two divided by three times four') # 12
# puts
# p computer('eight times four plus six divided by two minus two') # 33
# p computer('one plus four times two minus two') # 7
# p computer('nine divided by three times six') # 18
# p computer('seven plus four divided by two') # 9
# p computer('seven times four plus one divided by three minus two') # 26
# p computer('one plus four times three divided by two minus two') # 5
# p computer('nine divided by three times six') # 18



def word_cap(str)
  str.gsub(/\S+/, &:capitalize)
end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


def friday_13th?(year)
  (1..12).count { |m| Time.new(year, m, 13).friday? }
end

# p friday_13th?(2015)
# p friday_13th?(1986)

# variable names
#

def sequence_sum(num1, num2, num3)
  result = [] << num1
  index = 0
  return num1 if num1 == num2
  return 0 if num1 >  num2
  loop do
    num1 += num3
    break if num1 > num2
    result << num1
  end
  result.reduce(:+)
end

# p sequence_sum(2,2,2)# == 2
# p sequence_sum(2,6,2) #== 12  # (2 + 4 + 6)
# p sequence_sum(1,5,1)# == 15  # (1 + 2 + 3 + 4 + 5)
# p sequence_sum(1,5,3)# == 5   # (1 + 4)
# p sequence_sum(0, 15, 3)  # 45
# p sequence_sum(16, 15, 3) # 0
# p sequence_sum(2, 24, 22) # 26
# p sequence_sum(2, 2, 1)   # 2
# p sequence_sum(1, 15, 3)  # 35
# p sequence_sum(15, 1, 3)  # 0



def my_method(array)
  array.size > 1 ? array.map(&:abs2) : [*(array.first * 7 if array.first)]
end

def my_method(arr)
  arr.size == 1 ? [7 * arr.first] : arr.map(&:abs2)
end

# p my_method([])  # []
# p my_method([3]) # [21]
# p my_method([3, 4]) # [9, 16]
# p my_method([5, 6, 7]) # [25, 36, 49]

def mathphrase(num)
  result = [NUMBERS.sample]
  num.times { result << OPERATORS.sample << NUMBERS.sample }
  result.join(' ').gsub(/(?<=divided) /, ' by ')
end

# def mathphrase(num)
#   numbers = NUMBERS.shuffle * (num + 1)
#   operators = OPERATORS.shuffle * num
#   numbers.zip(operators).flatten.compact.join(' ')
# end

# NUMBERS = %w[zero one two three four five six seven eight nine ten]
# OPERATORS = %w[plus minus times divided]

# p mathphrase(1)
# p mathphrase(2)
# p mathphrase(3)
# p mathphrase(rand(10) + 1)





def cleanup(str)
  str.tr_s('^a-zA-Z', ' ')
end

# p cleanup("---what's my +*& line?")# == ' what s my line '





def merge(arr1, arr2)
  sorted = []
  idx1 = idx2 = 0
  while arr1[idx1] && arr2[idx2]
    if arr1[idx1] && arr2[idx2]
      if arr1[idx1] <= arr2[idx2]
        sorted << arr1[idx1]
        idx1 += 1
      else
        sorted << arr2[idx2]
        idx2 += 1
      end
    elsif arr1[idx1]
      sorted << arr1[idx1..-1]
    else
      sorted << arr2[idx2..-1]
    end
  end
  sorted
end

def merge(arr1, arr2)
  sorted = []
  idx1 = idx2 = 0
  while arr1[idx1] && arr2[idx2]
    if arr1[idx1] <= arr2[idx2]
      sorted << arr1[idx1]
      idx1 += 1
    else
      sorted << arr2[idx2]
      idx2 += 1
    end
  end
  sorted + arr1[idx1..-1] + arr2[idx2..-1]
end

def merge(arr1, arr2)
  return arr1 + arr2 if [arr1, arr2].any?(&:empty?)
  if arr1.first <= arr2.first
    arr1.take(1) + merge(arr1.drop(1), arr2)
  else
    arr2.take(1) + merge(arr1, arr2.drop(1))
  end
end

# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]
# p merge([], [])
# p merge([], [1])
# p merge([], [1, 2])
# p merge([3], [1, 2])
# p merge([3], [1, 2])
# p merge([3, 4, 5], [1, 2])
# p merge([3, 4, 5, 7, 9, 10, 15, 20, 100], [1, 2, 5, 10, 13, 22, 99, 150])
# p merge([5, 2, 1], [3, 2])



# input: arr
# output: sorted arr using merge/sort recurisve algorithm
# algorithm:
  #


def merge_sort(arr)
  return arr if arr.size == 1
  half = arr.size / 2
  left, right = merge_sort(arr.take(half)), merge_sort(arr.drop(half))
  merge(left, right)
end

# def unflatten(arr)
#   return arr if arr.size == 1
#   # arr = merge(arr.take(1), arr.drop(1)) if arr.size == 2
#   half = arr.size / 2
#   [unflatten(arr.take(half))] + [unflatten(arr.drop(half))]
# end

# def unflatten(arr)
#   return arr if arr.size == 1
#   # arr = merge(arr.take(1), arr.drop(1)) if arr.size == 2
#   half = arr.size / 2
#   # unflatten(arr.take(half)) + unflatten(arr.drop(half))
#   [unflatten(arr.take(half))] + [unflatten(arr.drop(half))]
# end

# def sort(arr)
#   return arr if arr.flatten == arr
#   # return [] if arr.size == 0
#   # merge(arr.first, arr[1]) + sort(arr[2..-1])
#   if arr.first.is_a?(Array)
#     if arr[1].is_a?(Array)
#       merge()
#     end
#   end
# end

def merge(arr1, arr2)
  return arr1 + arr2 if [arr1, arr2].any?(&:empty?)
  if arr1.first <= arr2.first
    arr1.take(1) + merge(arr1.drop(1), arr2)
  else
    arr2.take(1) + merge(arr1, arr2.drop(1))
  end
end

def merge_sort(arr)
  return arr if arr.size == 1
  half = arr.size / 2
  left, right = merge_sort(arr.take(half)), merge_sort(arr.drop(half))
  merge(left, right)
end


# def merge_sort(a)
#   a.size <= 1 ? a : merge(merge_sort(a.take(a.size / 2)), merge_sort(a.drop(a.size / 2)))
# end

def merge(arr1, arr2)
  sorted = []
  idx1 = idx2 = 0
  while arr1[idx1] && arr2[idx2]
    if arr1[idx1] <= arr2[idx2]
      sorted << arr1[idx1]
      idx1 += 1
    else
      sorted << arr2[idx2]
      idx2 += 1
    end
  end
  sorted + arr1[idx1..-1] + arr2[idx2..-1]
end

# accounts for nil and empty array arguments
def merge_sort(arr)
  return arr if arr.to_a.size <= 1
  arr = arr.each_slice(1)
  loop do
    arr = arr.each_slice(2).map { |a, b| b ? merge(a, b) : a  }
    return arr.first if arr.size == 1 && arr.first.is_a?(Array)
  end
end

def merge_sort(arr)
  return arr if arr.to_a.size <= 1
  arr = arr.each_slice(1)
  loop do
    arr = arr.each_slice(2).map { |a, b = []| merge(a, b) }
    return arr.first if arr.size == 1 && arr.first.is_a?(Array)
  end
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie))  ==
 %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) ==
   [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
p merge_sort(nil)
p merge_sort([])
p merge_sort([9])
p merge_sort([9, 1])
p merge_sort([9, 1, 2])
p merge_sort([9, 1, 2, 4])
p merge_sort([9, 1, 2, 4, 10])
p merge_sort([9, 1, 2, 4, 10, 20])
p merge_sort([9, 1, 2, 4, 10, 20, 19])
p merge_sort([9, 1, 2, 4, 10, 20, 19, 18])
p merge_sort([9, 1, 2, 4, 10, 20, 19, 18, 100])



def egyptian(num)
  result = []
  sum = 0
  denom = 1
  loop do
    current = 1/denom.to_r
    if sum + current <= num
      result << current.denominator
      sum += current
    end
    break if sum >= num
    denom += 1
  end
  result
end

def egyptian(num)
  denoms = []
  denom = 0
  while num > 0
    denom += 1
    current = 1/denom.to_r
    next unless current <= num
    denoms << denom
    num -= current

  end
  denoms
end

def unegyptian(denoms)
  denoms.map { |denom| 1/denom.to_r }.reduce(0, :+)
end

def unegyptian(denoms)
  denoms.reduce(0) { |sum, denom| sum + 1/denom.to_r }
end

# p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
# p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
# p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
# p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
# p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
# p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
# p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
# p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
# p unegyptian([1,2,3,6])
# puts

# p egyptian(21/23.to_r)
# p egyptian(12/4.to_r)
# p egyptian(2/3.to_r)
# # p egyptian(33/50.to_r)
# # p egyptian('0.66'.to_r)