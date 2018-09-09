# reduce_method_practice.rb

def reduce(arr, memo = nil)
  idx = memo ? 0 : 1
  memo ||= arr.first

  while idx < arr.size
    memo = yield(memo, arr[idx])
    idx += 1
  end

  memo
end

p reduce([1, 2, 3]) { |sum, n| sum + n }      # 6
p reduce([1, 2, 3], 10) { |sum, n| sum + n }  # 16
p reduce([1, 2, 3, 4]) { |sum, n| sum + n }   # 10
p reduce([1, 1, 1, 1, 1, 1]) { |sum, n| sum + n }   # 6
p reduce([1, 1, 1, 1, 1, 1], 1) { |sum, n| sum + n }   # 7
p reduce([]) { |sum, n| sum + n }             # nil
p reduce([], 0) { |sum, n| sum + n }          # 0
p reduce([1, 2, 3, 4], 1) { |product, n| product * n }   # 24
p reduce([1, 2, 3, 4], 2) { |product, n| product * n }   # 48
p reduce([1, 2, 3, 4]) { |product, n| product * n }      # 24
p reduce([]) { |product, n| product * n }                # nil
p reduce([], 1) { |product, n| product * n }             # 1
puts

animals = %w[cat dog rat fish mouse hamster bear lion tiger hippo zebra]
longest_animal = reduce(animals) do |longest, animal|
  animal.size > longest.size ? animal : longest
end
p longest_animal # 'hamster'

animals = %w[cat dog rat fish mouse hamster bear lion tiger hippo zebra]
shortest_animal = reduce(animals) do |shortest, animal|
  animal.size < shortest.size ? animal : shortest
end
p shortest_animal # 'cat'

# p reduce([1, 2, 3])                            # LocalJumpError
puts


# [1, 2, 3].reduce { |sum, n| sum + n }
# => 1 + 2 == 3
# => 3 + 3 == 6



array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }
  # => NoMethodError: undefined method `+' for nil:NilClass
puts
puts

def reduce(arr, memo = nil, sym = nil)
  arr = arr.to_a if arr.is_a?(Range)

  # raise "can't pass in both a symbol and a block" if block_given? && sym

  idx = 0

  if memo.nil? || memo.is_a?(Symbol)
    sym = memo
    memo = arr.first
    idx += 1
  end

  while idx < arr.size
    if sym.nil? && block_given?
      memo = yield(memo, arr[idx])
    else
      memo = memo.send(sym, arr[idx])
    end
    idx += 1
  end

  memo
end

p reduce(1..10) { |sum, n| sum + n } # 55
p reduce(1..0) { |sum, n| sum + n }  # nil
puts

p reduce(1..10, 0, :+)   # 55
p reduce(1..10, 0, :*)   # 0
p reduce(1..5, 1, :*)    # 120
p reduce(1..5, 2, :*)    # 240
p reduce(1..5, :*)       # 120
p reduce(1..10, :+)       # 55
p reduce([1, 2, 3], :+)   # 6
p reduce([1, 2, 3], 10, :+)   # 16
p reduce([1, 2, 3], 10, :+)  { |sum, n| 1 + 1 } # 16
p reduce((1..10), 10, :+)  { |sum, n| 1 + 1 } # 65
p reduce((1..10), 10)  { |sum, n| 1 + 1 } # 2
# p reduce((1..10), :+)  { |sum, n| 1 + 1 } # 2
# p reduce((1..10), :+)  { |sum, n| sum * n } # NoMethodError
p reduce(%w[cat rat dog bear], 'animals: ', :+)      # "animals: catratdogbear"
p reduce(%w[cat rat dog bear], 'animals: ', :concat) # "animals: catratdogbear"
puts
puts



def reduce(array, default=0)
  counter = 0
  accumulator = default

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

p reduce([1, 2, 3]) { |sum, n| sum + n }      # 6
p reduce([1, 2, 3], 10) { |sum, n| sum + n }  # 16
p reduce([1, 2, 3, 4]) { |sum, n| sum + n }   # 10
p reduce([1, 1, 1, 1, 1, 1]) { |sum, n| sum + n }   # 6
p reduce([1, 1, 1, 1, 1, 1], 1) { |sum, n| sum + n }   # 7
p reduce([]) { |sum, n| sum + n }             # nil
p reduce([], 0) { |sum, n| sum + n }          # 0
p reduce([1, 2, 3, 4], 1) { |product, n| product * n }   # 24
p reduce([1, 2, 3, 4], 2) { |product, n| product * n }   # 48
p reduce([1, 2, 3, 4]) { |product, n| product * n }      # 24
p reduce([]) { |product, n| product * n }                # nil
p reduce([], 1) { |product, n| product * n }             # 1
puts

animals = %w[cat dog rat fish mouse hamster bear lion tiger hippo zebra]
longest_animal = reduce(animals) do |longest, animal|
  animal.size > longest.size ? animal : longest
end
p longest_animal # 'hamster'

animals = %w[cat dog rat fish mouse hamster bear lion tiger hippo zebra]
shortest_animal = reduce(animals) do |shortest, animal|
  animal.size < shortest.size ? animal : shortest
end
p shortest_animal # 'cat'

# p reduce([1, 2, 3])                            # LocalJumpError
puts