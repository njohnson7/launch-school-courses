# ch8_table_of_contents_refactored.rb



# table_contents = [ ["Chapter 1", "Chapter 2", "Chapter 3"], ["Getting Started", "Numbers", "Letters"],
#                   ["page  1", "page  9", "page 13"] ]

table_contents = [ ["Table of Contents".center(60)],
                  ["Chapter 1: ", "Getting Started".ljust(20), "page  1".rjust(20)],
                  ["Chapter 2: ", "Numbers".ljust(20), "page  9".rjust(20)],
                  ["Chapter 3: ", "Letters".ljust(20), "page 13".rjust(20)] ]

table_contents.each do |ary|
  puts ary.join("")
end



# BOOK SOLUTION:

title = 'Table of Contents'
chapters = [ ['Getting Started', " 1"], ['Numbers', " 9"], ['Letters', "13"] ]

puts title.center(50)
puts

chap_num = 1
chapters.each do |chap|
  name = chap[0]
  page = chap[1]
  beginning = "Chapter #{chap_num}: #{name}"
  ending = "page #{page}"
  puts beginning.ljust(30) + ending.rjust(20)
  chap_num += 1
end



# BOOK SOLUTION 2:

puts title.center(50)
puts

chapters.each_with_index do |chap, idx|
  name, page = chap
  chap_num = idx + 1
  beginning = "Chapter #{chap_num}: #{name}"
  ending = "page #{page}"
  puts beginning.ljust(30) + ending.rjust(20)
end