# easy7_01.rb
# Combine Two Lists

# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the
# same number of elements.

def interleave(ary1, ary2)
  ary1.zip(ary2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1, 2, 3, 4], ['a', 'b', 'c', 'd'])
p interleave([9, 8, 7, 6, 5, 4, 3], %w(l m n o p q r))
puts


# Alternate solution:
def interleave(ary1, ary2)
  result = []
  product = ary1.product(ary2)
  step_size = ary1.size + 1
  last = product.size - 1
  (0..last).step(step_size) { |idx| result << product[idx] }

  result.flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1, 2, 3, 4], ['a', 'b', 'c', 'd'])
p interleave([9, 8, 7, 6, 5, 4, 3], %w(l m n o p q r))
puts


# Alternate solution 2:
def interleave(ary1, ary2)
  result = []
  product = ary1.product(ary2).each_slice(ary1.size).to_a
  ary1.size.times { |idx| result << product.dig(idx, idx) }

  result.flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1, 2, 3, 4], ['a', 'b', 'c', 'd'])
p interleave([9, 8, 7, 6, 5, 4, 3], %w(l m n o p q r))
puts


# Alternate solution 3:
def interleave(ary1, ary2)
  result = []
  idx = 0
  while idx < ary1.size
    result << ary1[idx] << ary2[idx]
    idx += 1
  end

  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1, 2, 3, 4], ['a', 'b', 'c', 'd'])
p interleave([9, 8, 7, 6, 5, 4, 3], %w(l m n o p q r))
puts


# Alternate solution 4:
def interleave(ary1, ary2)
  result = []
  ary1.size.times { result << ary1.shift << ary2.shift }
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1, 2, 3, 4], ['a', 'b', 'c', 'd'])
p interleave([9, 8, 7, 6, 5, 4, 3], %w(l m n o p q r))
puts


# Alternate solution 5:
def interleave(ary1, ary2)
  result = []
  ary1.each_with_index do |e, idx|
    result << e << ary2[idx]
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1, 2, 3, 4], ['a', 'b', 'c', 'd'])
p interleave([9, 8, 7, 6, 5, 4, 3], %w(l m n o p q r))
puts


# Alternate solution 6:
def interleave(ary1, ary2)
  [ary1, ary2].transpose.flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1, 2, 3, 4], ['a', 'b', 'c', 'd'])
p interleave([9, 8, 7, 6, 5, 4, 3], %w(l m n o p q r))
puts
