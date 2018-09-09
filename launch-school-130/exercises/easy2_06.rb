# easy2_06.rb


def each_with_index(arr)
  idx = 0
  while idx < arr.size
    yield(arr[idx], idx)
    idx += 1
  end
  arr
end

def each_with_index(arr, idx = 0, &block)
  return arr if idx == arr.size
  block.call(arr[idx], idx)
  each_with_index(arr, idx + 1, &block)
end

# recursive:
def each_with_index(arr, idx = 0, &block)
  idx == arr.size ? (return arr) : block.call(arr[idx], idx)
  each_with_index(arr, idx + 1, &block)
end

# using Array#each:
def each_with_index(arr, idx = -1)
  arr.each { |elem| yield(elem, idx += 1) }
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true

puts


result = each_with_index([1, 3, 6, 3]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6, 3]
