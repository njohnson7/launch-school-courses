# easy2_10.rb


# using Range#each:
def each_cons(arr, num)
  (0..arr.size - num).each { |idx| yield(*arr[idx, num]) } && nil
end

# recursive:
def each_cons(arr, num, &block)
  arr.size < num ? return : block.call(*arr.take(num))
  each_cons(arr.drop(1), num, &block)
end

# using Numeric#step:
def each_cons(arr, num)
  0.step(arr.size - num) { |idx| yield(*arr[idx, num]) } && nil
end

hash = {}
returned = each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p returned == nil
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
