# easy6_04.rb
# Reversed Arrays: Part 1

# Write a method that takes an Array as an argument, and reverses its elements
# in place; that is, mutate the Array passed in to this method. The return value
# should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse!(ary)
  ary.size.times { |idx| ary.insert(idx, ary.pop) }
  ary
end

p list = [1,2,3,4]
p result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id
puts '----------'

p list = %w(a b c d e)
p reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]
puts '----------'

p list = ['abc']
p reverse!(list) # => ["abc"]
p list == ["abc"]
puts '----------'

p list = []
p reverse!([]) # => []
p list == []
puts '===================='
puts


# Alternate solution:
def reverse!(ary)
  copy_ary = ary.clone
  (ary.size - 1).downto(0).with_index do |end_idx, start_idx|
    ary[start_idx] = copy_ary[end_idx]
  end

  ary
end

p list = [1,2,3,4]
p result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id
puts '----------'

p list = %w(a b c d e)
p reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]
puts '----------'

p list = ['abc']
p reverse!(list) # => ["abc"]
p list == ["abc"]
puts '----------'

p list = []
p reverse!([]) # => []
p list == []
puts '===================='
puts


# Alternate solution 2:
def reverse!(ary)
  (ary.size / 2 ).times do |idx|
    ary[idx], ary[-(idx + 1)] = ary[-(idx + 1)], ary[idx]
  end

  ary
end

p list = [1,2,3,4]
p result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id
puts '----------'

p list = %w(a b c d e)
p reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]
puts '----------'

p list = ['abc']
p reverse!(list) # => ["abc"]
p list == ["abc"]
puts '----------'

p list = []
p reverse!([]) # => []
p list == []
puts '===================='
puts


# Alternate solution 3:
def reverse!(ary)
  ary.sort_by!.with_index { |_, idx| -idx }
end

p list = [1,2,3,4]
p result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id
puts '----------'

p list = %w(a b c d e)
p reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]
puts '----------'

p list = ['abc']
p reverse!(list) # => ["abc"]
p list == ["abc"]
puts '----------'

p list = []
p reverse!([]) # => []
p list == []
puts '===================='
puts

# Alternate solution 4:
def reverse!(ary)
  (ary.size - 1).times { |idx| ary.insert(idx, ary.delete_at(-1)) }
  ary
end

p list = [1,2,3,4]
p result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id
puts '----------'

p list = %w(a b c d e)
p reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]
puts '----------'

p list = ['abc']
p reverse!(list) # => ["abc"]
p list == ["abc"]
puts '----------'

p list = []
p reverse!([]) # => []
p list == []
puts '===================='
puts
