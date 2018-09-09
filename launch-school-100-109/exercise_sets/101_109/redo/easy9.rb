# easy9.rb


puts
puts '-----------1-----------'

#  1.     Welcome Stranger
def greetings(arr, hash)
  name = arr.join(' ')
  job = hash.values.join(' ')
  "Hello #{name}! Nice to have a #{job} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.





puts
puts '-----------2-----------'

#  2.     Double Doubles
def twice(num)
  num_str = num.to_s
  middle = num_str.size / 2
  num_str[0...middle] == num_str[middle..-1] ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10







puts
puts '-----------3-----------'

#  3.     Always Return Negative
def negative(num)
  -num.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby






puts
puts '-----------4-----------'

#  4.     Counting Up
def sequence(num)
  (1..num).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]





puts
puts '-----------5-----------'

#  5.     Uppercase Check
def uppercase?(str)
  !str[/[a-z]/]
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true







puts
puts '-----------6-----------'

#  6.     How long are you?
def word_lengths(str)
  str.split.map { |word| "#{word} #{word.size}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []






puts
puts '-----------7-----------'

#  7.     Name Swapping
def swap_name(name)
  name.gsub(/(\w+) (\w+)/, '\2, \1')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'






puts
puts '-----------8-----------'

#  8.     Sequence Count
def sequence(count, start)
  (1..count).map { |n| start * n }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []






puts
puts '-----------9-----------'

#  9.     Grade book
GRADES = { A: 90..100, B: 80...90, C: 70...80, D: 60...70, F: 0...60 }

def get_grade(*scores)
  mean = scores.reduce(:+).fdiv(scores.size)
  GRADES.find { |_, score| score.include?(mean) }.first.to_s
end

p get_grade(50, 50, 95) == "D"
p get_grade(95, 90, 93) == "A"







puts
puts '-----------10-----------'

#  10.    Grocery List
def buy_fruit(fruits)
  fruits.flat_map { |fruit, count| [fruit] * count }
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
    ["apples", "apples", "apples", "orange", "bananas","bananas"]

