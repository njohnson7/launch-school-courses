# easy1_09.rb

def one?(arr)
  counter = 0
  arr.each do |elem|
    counter += 1 if yield(elem)
    return false if counter > 1
  end
  counter == 1
end

def one?(arr, &block)
  counter = 0
  arr.each do |elem|
    counter += 1 if block.call(elem)
    return false if counter > 1
  end
  counter == 1
end

def one?(arr, &block)
  arr.count { |elem| block.call(elem) } == 1
end

def one?(arr)
  seen_one = false
  arr.each do |elem|
    next unless yield(elem)
    seen_one ? (return false) : seen_one = true
  end
  seen_one
end

# recursive:
def one?(arr, counter = 0, &block)
  return counter == 1 if arr.empty? || counter > 1
  one?(arr.drop(1), block.call(arr.first) ? counter + 1 : counter, &block)
end


p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false
p one?([1, 3, 2, 5, 7]) { |value| value.even? }          == true
p one?([1, 3, 2, 4, 5, 7]) { |value| value.even? }          == false
