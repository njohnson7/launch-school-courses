# easy2_07.rb

# using Array#each:
def each_with_object(arr, obj)
  arr.each { |elem| yield(elem, obj) } && obj
end

def each_with_object(arr, obj, &block)
  return obj if arr.empty?
  block.call(arr.first, obj)
  each_with_object(arr.drop(1), obj, &block)
end

# recursive:
def each_with_object(arr, obj, &block)
  arr.empty? ? (return obj) : block.call(arr.first, obj)
  each_with_object(arr.drop(1), obj, &block)
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}

result = each_with_object([1, 2, 7], []) do |value, list|
  list += [value]
end
p result == []
