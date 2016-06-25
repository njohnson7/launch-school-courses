# easy8_06.rb
# fizzbuzz

# Write a method that takes two arguments: the first is the starting number, and
# the second is the ending number. Print out all numbers between the two
# numbers, except if a number is divisible by 3, print "Fizz", if a number is
# divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5,
# print "FizzBuzz".

def fizzbuzz(start_num, end_num)
  result = []
  (start_num..end_num).each do |n|
    if n % 3 == 0 && n % 5 == 0
      result << 'FizzBuzz'
    elsif n % 3 == 0
      result << 'Fizz'
    elsif  n % 5 == 0
      result << 'Buzz'
    else
      result << n
    end
  end
  result.join(', ')
end

p fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
puts


# Alternate solution:
def fizzbuzz(start_num, end_num)
  start_num.upto(end_num).to_a.map do |n|
    if n % 3 == 0 && n % 5 == 0 then 'FizzBuzz'
    elsif n % 3 == 0 then 'Fizz'
    elsif  n % 5 == 0 then 'Buzz'
    else n
    end
  end.join(', ')
end

p fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
puts


# Alternate solution 2:
def fizzbuzz(start_num, end_num)
  result = ''
  (start_num..end_num).each do |n|
    result << ', '
    next result << n.to_s unless n % 3 == 0 || n % 5 == 0
    result << 'Fizz' if n % 3 == 0
    result << 'Buzz' if n % 5 == 0
  end
  result[0..1] = ''
  result
end

p fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
puts


# Alternate solution 3:
def fizzbuzz(start_num, end_num)
  (start_num..end_num).each_with_object('') do |n, str|
    str << n.to_s unless n % 3 == 0 || n % 5 == 0
    str << 'Fizz' if n % 3 == 0
    str << 'Buzz' if n % 5 == 0
    str << ', ' unless n == end_num
  end
end

p fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
puts


# Alternate solution 4:
def fizzbuzz(start_num, end_num)
  (start_num..end_num).each_with_object('') do |n, str|
    str << n.to_s unless n % 3 == 0 || n % 5 == 0
    str << 'Fizz' if n % 3 == 0
    str << 'Buzz' if n % 5 == 0
    str << ', ' unless n == end_num
  end
end

p fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
puts


# Alternate solution 4:
def fizzbuzz(start_num, end_num)
  (start_num..end_num).each_with_object([]) do |n, ary|
    elem = ''
    elem = 'Fizz' if n % 3 == 0
    elem += 'Buzz' if n % 5 == 0
    elem = n if elem.empty?
    ary << elem
  end.join(', ')
end

p fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
