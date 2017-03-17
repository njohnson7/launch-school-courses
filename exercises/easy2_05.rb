# easy2_05.rb


def drop_while(arr)
  idx = 0
  idx += 1 while idx < arr.size && yield(arr[idx])
  arr[idx..-1]
end

# using Enumerable#drop and while loop:
def drop_while(arr)
  arr = arr.drop(1) while yield(arr.first) && !arr.empty?
  arr
end

# recursive:
def drop_while(arr, &block)
  (arr.empty? || !block.call(arr.first)) ? arr : drop_while(arr[1..-1], &block)
end

# using Enumerable#each_with_index:
def drop_while(arr)
  arr.each_with_index { |el, idx| return arr[idx..-1] unless yield(el) } && []
end

# using Array#index:
def drop_while(arr)
  arr[arr.index { |elem| !yield(elem) } || arr.size..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
