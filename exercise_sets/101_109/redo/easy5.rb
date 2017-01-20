# easy5.rb


puts '---------1-----------'

# 1.    ASCII String Value
def ascii_value(str)
  str.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0




puts
puts '---------2-----------'

# 2.    After Midnight (Part 1)
def time_of_day(mins)
  mins_start = 24 * 60
  mins_end = (mins_start + mins) % 1440
  hours_end, mins_end = mins_end.divmod(60)
  format('%.2d:%.2d', hours_end, mins_end)
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"





puts
puts '---------3-----------'

# 3.    After Midnight (Part 2)
def after_midnight(time)
  hours, mins = time.split(':').map(&:to_i)
  (hours * 60 + mins) % 1440
end

def before_midnight(time)
  (1440 - after_midnight(time)) % 1440
end

p after_midnight('00:00')  == 0
p before_midnight('00:00')  == 0
p after_midnight('12:34')  == 754
p before_midnight('12:34')  == 686
p after_midnight('24:00')  == 0
p before_midnight('24:00')  == 0




puts
puts '---------4-----------'

# 4.    Letter Swap
def swap(str)
  regex = /\b(?<first>[a-z])(?<mid>[a-z]*)(?<last>[a-z])\b/i
  str.gsub(regex, '\k<last>\k<mid>\k<first>')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'





puts
puts '---------5-----------'

# 5.    Clean up the words
def cleanup(str)
  str.gsub(/[^a-z]+/i, ' ')
end


p cleanup("---what's my +*& line?") == ' what s my line '




puts
puts '---------6-----------'

# 6.    Letter Counter (Part 1)
def word_sizes(str)
  str.split.group_by(&:size).map { |size, words| [size, words.size] }.sort.to_h
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}





puts
puts '---------7-----------'

# 7.    Letter Counter (Part 2)
def word_sizes(str)
  str.downcase
     .split
     .group_by { |word| word.count('a-z') }
     .map { |size, words| [size, words.size] }
     .sort
     .to_h
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}




puts
puts '---------8-----------'

# 8.    Alphabetical Numbers
ENGLISH_NUM = %w[
  zero one two three four five six seven eight nine ten eleven twelve thirteen
  fourteen fifteen sixteen seventeen eighteen nineteen
]

def alphabetic_number_sort(arr)
  arr.sort_by { |num| ENGLISH_NUM[num] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]




puts
puts '---------9-----------'

# 9.    ddaaiillyy ddoouubbllee
def crunch(str)
  str.squeeze
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''



puts
puts '---------10-----------'

# 10.   Bannerizer
def print_in_box(str)
  width = str.size + 2
  top_bot = "+#{'-' * width}+"
  mid = "|#{' ' * width}|"
  text = "| #{str} |"
  puts [top_bot, mid, text, mid, top_bot]
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
