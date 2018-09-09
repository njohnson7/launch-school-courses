# easy1_06.rb

def any?(arr)
  idx = 0
  until idx == arr.size
    return true if yield(arr[idx])
    idx += 1
  end
  false
end

def any?(arr)
  arr.each { |elem| return true if yield(elem) } && false
end

# recursive:
def any?(arr, &block)
  return false if arr.empty?
  block.call(arr.first) ? true : any?(arr.drop(1), &block)
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
puts

p any?({a: 1, b: 2, c: 3}) { |k, v| v == 1 }
p any?({a: 1, b: 2, c: 3}) { |k, v| k == :a }
p any?({a: 1, b: 2, c: 3}) { |k, v| k == :d }
p any?({a: 1, b: 2, c: 3}) { |k, v| v == 5 }
