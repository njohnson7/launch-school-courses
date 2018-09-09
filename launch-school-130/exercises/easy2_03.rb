# easy2_03.rb

def map(arr)
  arr.each_with_object([]) { |elem, mapped| mapped << yield(elem) }
end

def map(arr)
  arr.reduce([]) { |mapped, elem| mapped += [yield(elem)] }
end

def map(arr)
  arr.reduce([]) { |mapped, elem| [*mapped, yield(elem)] }
end

# recursive - works with arrays, hashes, and sets:
def map(arr, &block)
  arr.empty? ? [] : [block.call(arr.first)] + map(arr.drop(1), &block)
end

# recursive - works with arrays, hashes, and sets:
def map(arr, &block)
  arr.empty? ? [] : [block.call(arr.first), *map(arr.drop(1), &block)]
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

p({ a: 1, b: 2, c: 3 }.map { |k, v| [v * 2, k] })
p map({ a: 1, b: 2, c: 3 }) { |k, v| [v * 2, k] }
puts

require 'set'
p map(Set[1, 2, 3]) { |n| n * 2 }

hash = { 1=> "m", 2=> "c", 3=> "s" }
set = Set[1, 3, 6]

p map(hash) { |_, v| v += "at" } == ["mat", "cat", "sat"]
p map(set) { |value| value**2 } == [1, 9, 36]
p map({}) { |value| true } == []
p map(Set[]) { |value| true } == []
p map(hash) { |value| false } == [false, false, false]
p map(set) { |value| false } == [false, false, false]
p map(hash) { |_, value| value.upcase } == ['M', 'C', 'S']
p map(set) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4, 5, 6]]
