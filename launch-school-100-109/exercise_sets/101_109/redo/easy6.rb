# easy6.rb


puts '---------1---------'

# 1.    Cute angles
def dms(num)
  deg = num.to_i
  min = (num - deg) * 60
  sec = ((min - min.to_i) * 60).round
  min, sec = min + 1, 0 if sec == 60
  format('%d°%.2d\'%.2d"', deg, min.to_i, sec)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(30.263888889)


puts
puts '---------2---------'

# 2.    Delete vowels
def remove_vowels(arr)
  arr.map { |word| word.gsub(/[aeiou]/i, '') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']



puts
puts '---------3---------'

# 3.    Fibonacci Number Location By Length
def find_fibonacci_index_by_length(length)
  fib.find_index { |n| n.to_s.size >= length } + 1
end

def fib
  Enumerator.new do |y|
    a = b = 1
    loop do
      y << a
      a, b = b, a + b
    end
  end
end

p find_fibonacci_index_by_length(2)# == 7
p find_fibonacci_index_by_length(10)# == 45
p find_fibonacci_index_by_length(100)# == 476
p find_fibonacci_index_by_length(1000)# == 4782
# p find_fibonacci_index_by_length(10000)# == 47847




puts
puts '---------4---------'

# 4.    Reversed Arrays (Part 1)
def reverse!(arr)
  1.upto(arr.size / 2) { |idx| arr[idx - 1], arr[-idx] = arr[-idx], arr[idx - 1] }
  arr
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!([]) # => []
p list == []




puts
puts '---------5---------'

# 5.    Reversed Arrays (Part 2)
def reverse(arr)
  1.upto(arr.size).with_object([]) { |idx, res| res << arr[-idx] }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 2, 3]                      # => [1, 2, 3]
p new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true




puts
puts '---------6---------'

# 6.    Combining Arrays
def merge(arr1, arr2)
  arr1 | arr2
end

p merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]





puts
puts '---------7---------'

# 7.    Halvsies
def halvsies(arr)
  half_idx = arr.size.fdiv(2).ceil
  [arr[0...half_idx], arr[half_idx..-1]]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]




puts
puts '---------8---------'

# 8.    Find the Duplicate
def find_dup(arr)
  arr.find { |x| arr.count(x) > 1 }
end


p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73



puts
puts '---------9---------'

# 9.    Does My List Include This?
def include?(arr, val)
  arr.any? { |x| x == val }
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false




puts
puts '---------10---------'

# 1.0   Right Triangles
def triangle(num)
  1.upto(num) { |n| puts "#{' ' * (num - n)}#{'*' * n}" }
end

triangle(5)
#     *
#    **
#   ***
#  ****
# *****

triangle(9)
#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********
