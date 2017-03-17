# easy1_10.rb


def count(arr)
  counter = 0
  arr.each { |elem| counter += 1 if yield(elem) }
  counter
end

def count(arr, counter = 0, &block)
  return counter if arr.empty?
  counter += 1 if block.call(arr.first)
  count(arr.drop(1), counter, &block)
end

# recursive:
def count(arr, total = 0, &block)
  return total if arr.empty?
  count(arr.drop(1), block.call(arr.first) ? total + 1 : total, &block)
end

# def count(arr)
#   arr.map { |elem| yield(elem) }.select(&:itself).size
# end

# def count(arr)
#   arr.select { |elem| yield(elem) }.size
# end

# using Array#map and Enumerable#sum:
def count(arr)
  arr.map { |elem| yield(elem) ? 1 : 0 }.sum
end

# recursive - refactored:
def count(arr, &block)
  return 0 if arr.empty?
  count(arr.drop(1), &block) + (block.call(arr.first) ? 1 : 0)
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
