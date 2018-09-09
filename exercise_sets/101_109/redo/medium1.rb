# medium1.rb



puts '----------1---------'

#  1.    Rotation (Part 1)
def rotate_array(arr)
  [*arr[1..-1], arr.first]
end


p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true



puts
puts '----------2---------'

#  2.    Rotation (Part 2)
def rotate_rightmost_digits(num, n)
  num = num.to_s
  half = num.size - n
  left, right = num[0...half], num[half..-1]
  "#{left}#{rotate_array(right.chars).join}".to_i
end


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917



puts
puts '----------3---------'

#  3.    Rotation (Part 3)
def max_rotation(num)
  num.to_s.size.downto(1) { |n| num = rotate_rightmost_digits(num, n) }
  num
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845



puts
puts '----------4---------'

#  4.    1000 Lights
def lights(num)
  (1..num).select { |n| Math.sqrt(n) % 1 == 0 }
end

p lights(5)
p lights(10)
p lights(1000)





puts
puts '----------5---------'

#  5.    Diamonds!
def diamond(n)
  rows = (1..n).step(2).map { |row| "#{'*' * row}".center(n) }
  rows += rows[0, n / 2].reverse
  puts rows
end

diamond(1)
diamond(3)
diamond(9)






puts
puts '----------6---------'

#  6.    Stack Machine Interpretation
def minilang(str)
  stack = []
  register = 0
  program = str.split
  program.each do |input|
    case input
    when 'PUSH'  then stack << register
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = input.to_i
    end
  end
end


minilang('PRINT')
# 0
puts

minilang('5 PUSH 3 MULT PRINT')
# 15
puts

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts

minilang('5 PUSH POP PRINT')
# 5
puts

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts

minilang('-3 PUSH 5 SUB PRINT')
# 8
puts

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
puts






puts
puts '----------7---------'

#  7.    Word to Digit
WORD_DIGIT = %w[zero one two three four five six seven eight nine]

def word_to_digit(str)
  regex = /#{WORD_DIGIT.join('|')}/
  word_digit = WORD_DIGIT.map.with_index { |word, dig| [word, dig] }.to_h
  str.gsub(regex, word_digit)
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') ==
  'Please call me at 5 5 5 1 2 3 4. Thanks.'




puts
puts '----------8---------'

#  8.    Fibonacci Numbers (Recursion)
def fibonacci(nth)
  return 1 if nth == 1 || nth == 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end


p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
# p fibonacci(40)



puts
puts '----------9---------'

#  9.    Fibonacci Numbers (Procedural)
def fibonacci(nth)
  fib = Enumerator.new do |y|
    a = b = 1
    loop do
      y << a
      a, b = b, a + b
    end
  end
  # fib.take(nth).last
  target = nil
  nth.times { target = fib.next }
  target
end

# p fibonacci(20) == 6765
# p fibonacci(100)  == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
# p fibonacci(15)


def fibonacci(nth)
  a = b = 1
  (nth - 2).times do
    a, b = b, a + b
  end
  b
end

p fibonacci(20) == 6765
p fibonacci(100)  == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
p fibonacci(15)
p fibonacci(16)
p fibonacci(17)
p fibonacci(21)
p fibonacci(5)
p fibonacci(12)


puts
puts '----------10---------'

#  1.0   Fibonacci Numbers (Last Digit)
def fibonacci_last(nth)
  # fibonacci(nth).to_s[-1].to_i
  fibonacci(nth) % 10
end


p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4



