# easy2_09.rb

# using Range#each:
def each_cons(arr)
  (0..arr.size - 2).each { |idx| yield(arr[idx, 2]) } && nil
end

# recursive:
def each_cons(arr, &block)
  arr.size < 2 ? return : block.call(arr[0, 2])
  each_cons(arr.drop(1), &block)
end


# def each_cons(arr)
#   enum = arr.each
#   # StopIteration will be rescued by loop:
#   loop { yield(enum.next, enum.peek) }
#   nil
# end

# def each_cons(arr)
#   arr.reduce(arr) do |new_arr, _|
#     break if new_arr.size < 2
#     yield(new_arr[0, 2])
#     new_arr.drop(1)
#   end
#   nil
# end

p each_cons([]) { |a, b| p a, b } == nil
# p [].to_enum.next # `next': iteration reached an end (StopIteration)

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}

hash = {}
returned = each_cons([1, 3, 6, 10]) do |value|
  hash[value] = true
end
p hash
