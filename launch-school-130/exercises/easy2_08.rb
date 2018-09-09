# easy2_08.rb

def max_by(arr)
  return nil if arr.empty?
  max_elem = arr.first
  max_value = yield(max_elem)
  idx = 1
  while idx < arr.size
    elem = arr[idx]
    block_result = yield(elem)
    max_elem, max_value = [elem, block_result] if block_result > max_value
    idx += 1
  end
  max_elem
end

# using Enumerable#reduce:
def max_by(arr)
  arr.reduce { |max, elem| yield(max) > yield(elem) ? max : elem }
end

# recursive:
def max_by(arr, max = arr.first, &block)
  return max if arr.size <= 1
  max = block.call(max) > block.call(arr[1]) ? max : arr[1]
  max_by(arr.drop(1), max, &block)
end

# using Array#max (not sure if this is allowed...):
def max_by(arr)
  arr.max { |a, b| yield(a) <=> yield(b) }
end

# using Enumberable#sort_by (not sure if this is allowed...):
def max_by(arr)
  arr.sort_by { |elem| yield(elem) }.last
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([-7, 8]) { |value| value * 3 } == 8
p max_by([]) { |value| value + 5 } == nil
