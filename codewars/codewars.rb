def luckySevens(arr)
  count = 0
  arr[1..-2].each.with_index(1) do |row, x|
    row[1..-2].each.with_index(1) do |num, y|
      next unless num == 7
      sum = row[y - 1] + row[y + 1] + arr[x - 1][y] + arr[x + 1][y]
      count += 1 if Math.cbrt(sum) % 1 < 0.000000001
    end
  end
  count
end

# testBoard0 = [[ 740, 183, 194, 902, 297 ],
#               [ 772, 355, 668, 54,  993 ],
#               [ 72 , 7,   229, 169, 164 ],
#               [ 730, 73,  13,  7,   3   ],
#               [ 26 , 570, 955, 31,  116 ]]
# p luckySevens(testBoard0)  # 2

# testBoard1 = [[ 647, 25,  530, 200, 438, 635 ],
#               [ 10,  7,   19,  17,  439, 7   ],
#               [ 271, 10,  3,   7,   5,   187 ],
#               [ 768, 430, 876, 2,   335, 57  ],
#               [ 21,  7,   229, 108, 7,   63  ],
#               [ 939, 49,  199, 611, 6,   513 ]]
# p luckySevens(testBoard1)  # 4

# testBoard2 = [[ 74,  4,   837, 849, 68,  7,   365, 657 ],
#               [ 622, 7,   502, 520, 34,  112, 7,   31  ],
#               [ 909, 345, 190, 7,   7,   17,  4,   7   ],
#               [ 465, 31,  7,   79,  6,   216, 108, 7   ],
#               [ 113, 977, 43,  771, 6,   457, 507, 953 ],
#               [ 654, 786, 648, 145, 7,   182, 7,   230 ],
#               [ 478, 328, 30,  7,   98,  825, 81,  384 ],
#               [ 929, 74,  261, 70,  968, 638, 7,   109 ]]
# p luckySevens(testBoard2)  # 5

# testBoard3 = [[ 506, 664, 946, 363, 56,  144, 706, 74,  177, 7,   694 ],
#               [ 437, 474, 348, 25,  7,   36,  370, 22,  7,   78,  45  ],
#               [ 7,   261, 48,  821, 8,   181, 7,   115, 66,  715, 7   ],
#               [ 734, 67,  724, 904, 312, 446, 63,  894, 4,   300, 838 ],
#               [ 11,  7,   24,  153, 7,   18,  743, 1,   7,   2,   823 ],
#               [ 139, 23,  16,  7,   29,  7,   53,  410, 1,   65,  509 ],
#               [ 744, 1,   7,   7,   128, 174, 230, 131, 21,  7,   33  ],
#               [ 341, 253, 3,   870, 38,  7,   113, 671, 99,  6,   744 ],
#               [ 632, 723, 320, 430, 61,  18,  37,  28,  7,   69,  936 ],
#               [ 383, 7,   753, 19,  7,   36,  654, 781, 20,  921, 969 ],
#               [ 283, 334, 463, 7,   9,   143, 411, 443, 958, 7,   7   ]]
# p luckySevens(testBoard3)  # 11

# testBoard4 = [[ 186, 946, 992, 578, 286, 10,  295, 499, 369 ],
#               [ 408, 16,  347, 608, 827, 7,   7,   727, 858 ],
#               [ 5,   7,   4,   638, 409, 472, 817, 1,   531 ],
#               [ 792, 2,   179, 7,   133, 684, 0,   7,   0   ],
#               [ 764, 374, 962, 50,  46,  95,  474, 0,   460 ],
#               [ 165, 7,   133, 5,   7,   11,  825, 40,  626 ],
#               [ 240, 57,  954, 447, 2,   551, 1,   7,   17  ],
#               [ 7,   738, 7,   450, 37,  7,   120, 6,   7   ],
#               [ 7,   683, 902, 66,  402, 21,  870, 323, 233 ]]
# p luckySevens(testBoard4)  # 7



FOODS = { "chickenwings" => 5, "hamburgers" => 3, "hotdogs" => 2 }

def scoreboard(arr)
  arr.map { |hsh| [['name', hsh['name']], ['score', hsh.map { |k, v| FOODS[k].to_i * v.to_i }.reduce(0, :+)]].to_h }
     .sort_by { |hsh| [-hsh['score'], hsh['name']] }
end




def histogram(results)
  results.map.with_index(1) { |num, idx| "#{idx}|#{'#' * num}#{" #{num}" if num > 0}\n" }
         .reverse.join
end



def palindrome(num)
  return 'Not valid' unless num.is_a?(Integer) && num.positive?
  digits = num.to_s.chars
  palindromes = (2..digits.size).flat_map { |size| digits.each_cons(size).to_a }
                                .map(&:join)
                                .select { |n| !n[/\A0.*0\z/] && n == n.reverse }
                                .map(&:to_i)
                                .uniq
                                .sort
  palindromes.empty? ? 'No palindromes found' : palindromes
end



# p palindrome(2)   #"No palindromes found"
# p palindrome(1551)   #[55,1551]
# p palindrome(221122)   #[11,22,2112,221122]
# p palindrome(10015885)   #[88,1001,5885]
# p palindrome(13598)   #"No palindromes found"
# p palindrome("ACCDDCCA")   #"Not valid"
# p palindrome("1551")   #"Not valid"
# p palindrome(-4505)   #"Not valid"





def sort_it_out(array)
  array.partition { |num| num.to_i.odd? }
       .tap { |odds, evens| return odds.sort + evens.sort.reverse }
end

# p sort_it_out([26,243,52,2,432414,1,11,46,32]) == [1,11,243,432414,52,46,32,26,2]
# p sort_it_out([19,65,88,112,60,14,33,49,88]) == [19,33,49,65,112,88,88,60,14]
# p sort_it_out([]) == []
# p sort_it_out([68,25,99,50,10,67,2,5,8,34,67]) == [5,25,67,67,99,68,50,34,10,8,2]
# p sort_it_out([11,22,33,44,55,55,90.4,4,78]) == [11,33,55,55,90.4,78,44,22,4]




def bubble_sort_official!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

def bubble_sort!(arr, n = arr.size)
  n.zero? ? (return arr) : new_n = 0
  (1...n).each do |idx|
    next if arr[idx - 1] <= arr[idx]
    arr[idx - 1], arr[idx], new_n = arr[idx], arr[idx - 1], idx
  end
  bubble_sort!(arr, new_n)
end



def benchmark
  start = Time.now
  yield
  puts "Duration: #{Time.now - start} seconds"
end

arr = Array.new(10_000) { rand(1..1000) }
arr_copy = arr.dup

# benchmark { bubble_sort_official!(arr) }  # 7.11 seconds
# benchmark { bubble_sort!(arr_copy) }      # 5.19 seconds
puts

arr = Array.new(30_000) { rand(1..2) }
arr_copy = arr.dup

# benchmark { bubble_sort_official!(arr) }
# benchmark { bubble_sort!(arr_copy) }