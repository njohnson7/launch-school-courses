# easy1_08.rb

def any?(arr)
  arr.each { |elem| return true if yield(elem) } && false
end

def all?(arr)
  !!arr.each { |elem| yield(elem) || (return false) }
end


def none?(arr)
  arr.each { |elem| return false if yield(elem) }
  true
end

# using each:
def none?(arr)
  !!arr.each { |elem| yield(elem) && (return false) }
end

# using all?:
def none?(arr)
  all?(arr) { |elem| !yield(elem) }
end

# using any?:
def none?(arr)
  !any?(arr) { |elem| yield(elem) }
end

# using any? and explicit block arg (proc):
def none?(arr, &block)
  !any?(arr, &block)
end

def none?(arr, &block)
  arr.count { |elem| block.call(elem) } == 0
end

# recursive:
def none?(arr, &block)
  return true if arr.empty?
  block.call(arr.first) ? false : none?(arr.drop(1), &block)
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
