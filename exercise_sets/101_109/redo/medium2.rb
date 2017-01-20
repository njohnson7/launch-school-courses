# medium2.rb



puts '-----------1----------'

#  1.    Longest Sentence
def longest_sentence(file_name)
  text = File.read(file_name)
  longest = text.gsub(/\n|\r/, ' ')
                .split(/(?<=\.|!|\?) */)
                .max_by { |str| str.split.size }
  puts longest
  puts longest.split.size
end

longest_sentence('text.txt')
puts
longest_sentence('pg84.txt')






puts
puts '-----------2----------'

#  2.    Now I Know My ABCs
BLOCKS =  [%[B O], %[X K], %[D Q], %[C P], %[N A], %[G T], %[R E], %[F S],
           %[J W], %[H U], %[V I], %[L Y], %[Z M]]

def block_word?(str)
  blocks = BLOCKS.dup
  str.upcase.each_char do |char|
    block = blocks.find { |b| b.include?(char) }
    block ? blocks.delete(block) : (return false)
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true




puts
puts '-----------3----------'

#  3.    Lettercase Percentage Ratio
def letter_percentages(str)
  letter_case = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }
  letter_case.map { |type, pat| [type, str.count(pat).fdiv(str.size) * 100 ] }.to_h
end


p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }



puts
puts '-----------4----------'

#  4.    Matching Parentheses?
def balanced?(str)
  balanced = str.scan(/\(|\)/).reduce(0) do |count, char|
    return false if count.negative?
    count + (char == '(' ? 1 : -1)
  end
  balanced.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false




puts
puts '-----------5----------'

#  5.    Triangle Sides
def triangle(*sides)
  unless sides.all?(&:positive?) && sides.min(2).reduce(:+) > sides.max
    return :invalid
  end
  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  else        :scalene
  end
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid




puts
puts '-----------6----------'

#  6.    Tri-Angles
def triangle(*angles)
  return :invalid unless angles.all?(&:positive?) && angles.reduce(:+) == 180
  if angles.all? { |angle| angle < 90 }     then :acute
  elsif angles.one? { |angle| angle > 90 } then :obtuse
  else                                           :right
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid




puts
puts '-----------7----------'

#  7.    Unlucky Days
def friday_13th?(year)
  (1..12).reduce(0) do |count, month|
    Time.new(year, month, 13).friday? ? count + 1 : count
  end
end

p friday_13th?(2015) == 3
p friday_13th?(1986) == 1
p friday_13th?(2019) == 2




puts
puts '-----------8----------'

#  8.    Next Featured Number Higher than a Given Value
def featured(num)
  num += 1
  num += 1 until num % 14 == 7
  return 'Error: no possible number.' if num >= 9876543210
  num += 14 until no_repeating_digits?(num)
  num
end

def no_repeating_digits?(num)
  digits = num.to_s.chars
  digits.size == digits.uniq.size
end


p featured(12) #== 21
p featured(20) #== 21
p featured(21) #== 35
p featured(997) #== 1029
p featured(1029) #== 1043
p featured(999_999) #== 1_023_547
# p featured(999_999_987) #== 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements




puts
puts '-----------9----------'

#  9.    Bubble Sort
def bubble_sort!(arr)
  loop do
    idx = 0
    swapped = false
    while idx < arr.size - 1
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swapped = true
      end
      idx += 1
    end
    break unless swapped
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)




puts
puts '-----------10----------'

#  10.   Sum Square - Square Sum
def sum_square_difference(num)
  nums = (1..num)
  nums.reduce(:+)**2 - nums.reduce(0) { |sum, n| sum + n**2 }
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
