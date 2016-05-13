# practice.rb



# pseudo code example method from assignment:
def find_greatest(numbers)
  return if numbers.nil? || numbers.empty?        # guard clause
  saved_number = numbers.first
  numbers.each do |num|
    next if saved_number >= num
    saved_number = num
  end

  saved_number
end

puts find_greatest([1, 10, 3, 6, 2, 15, 13, 7, 3])        # => 15



# a method that returns the sum of 2 integers:
def sum(num1, num2)
  num1 + num2
end

puts sum(13, 10)



# method that takes ary of strings, and returns a str that is all those strings concatenated together:
def combine_strings(strings)
  comb_str = ''
  strings.each { |str| comb_str << str }
  comb_str
end

puts combine_strings(%w(this is pretty cool))



# method that takes an array of ints, and returns a new ary w/ every other elem:
def every_other(integers)
  new_ary = []
  integers.each_with_index { |int, idx| new_ary << int if idx.even? }
  new_ary
end

p every_other((0..10).to_a)