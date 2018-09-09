# easy6_07.rb
# Halvsies

# Write a method that takes an Array as an argument, and returns two Arrays that
# contain the first half and second half of the original Array, respectively. If
# the original array contains an odd number of elements, the middle element
# should be placed in the first half Array.

def halvsies(ary)
  num_of_first_elems = ary.size - ary.size / 2
  [ary.slice!(0, num_of_first_elems), ary]
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]
p halvsies([1, 5, 2, 4, 3, 7])
p halvsies([1, 5, 2, 4, 3, 7, 9])
puts


# Alternate solution:
def halvsies(ary)
  num_of_first_elems = ary.size - ary.size / 2
  [ary.take(num_of_first_elems), ary.drop(num_of_first_elems)]
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]
p halvsies([1, 5, 2, 4, 3, 7])
p halvsies([1, 5, 2, 4, 3, 7, 9])
puts


# Alternate solution 2:
def halvsies(ary)
  num_of_first_elems = (ary.size / 2.0).ceil
  num_of_last_elems = ary.size - num_of_first_elems
  [ary.first(num_of_first_elems), ary.last(num_of_last_elems)]
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]
p halvsies([1, 5, 2, 4, 3, 7])
p halvsies([1, 5, 2, 4, 3, 7, 9])
puts


# Alternate solution 3:
def halvsies(ary)
  return [[],[]] if ary.empty?
  split_point = ary[(ary.size / 2.0).ceil]
  ary = ary.slice_before { |elem| elem == split_point }.to_a
  ary.size == 1 ? ary + [[]] : ary
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]
p halvsies([1, 5, 2, 4, 3, 7])
p halvsies([1, 5, 2, 4, 3, 7, 9])
puts


# Alternate solution 4:
def halvsies(ary)
  num_of_first_elems = (ary.size / 2.0).ceil
  [ary.values_at(0...num_of_first_elems), ary.values_at(num_of_first_elems..-1)]
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]
p halvsies([1, 5, 2, 4, 3, 7])
p halvsies([1, 5, 2, 4, 3, 7, 9])
puts


# Alternate solution 5:
def halvsies(ary)
  num_of_first_elems = (ary.size / 2.0).ceil
  ary.partition.with_index { |_, idx| idx < num_of_first_elems}
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]
p halvsies([1, 5, 2, 4, 3, 7])
p halvsies([1, 5, 2, 4, 3, 7, 9])
puts


# Book solution:
def halvsies(ary)
  first_half = ary[0, (ary.size / 2.0).ceil]
  second_half = ary[first_half.size, ary.size - first_half.size]
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]
p halvsies([1, 5, 2, 4, 3, 7])
p halvsies([1, 5, 2, 4, 3, 7, 9])
puts
