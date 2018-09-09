# medium1_02.rb

# Fixed Array

# A fixed-length array is an array that always has a fixed number of elements.
# Write a class that implements a fixed-length array, and provides the necessary
# methods to support the following code:

class FixedArray
  attr_reader :arr

  def initialize(size)
    @arr = [nil] * size
  end

  def [](idx)
    arr.fetch(idx)
  end

  def []=(idx, value)
    # raise IndexError if idx >= arr.size
    self[idx]
    arr[idx] = value
  end

  def to_a
    arr.dup
  end

  def to_s
    to_a.to_s
  end
end



fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

puts fixed_array.class != Array
puts fixed_array.to_a.class == Array

a = fixed_array.to_a
puts a == fixed_array.to_a
a.delete_at(1)
puts a != fixed_array.to_a
puts fixed_array.to_a.size == 5

# The above code should output true 15 times.
