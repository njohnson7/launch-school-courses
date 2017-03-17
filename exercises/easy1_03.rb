# easy1_03.rb


# Find Missing Numbers

# Write a method that takes a sorted array of integers as an argument, and
# returns an array that includes all of the missing integers (in order) between
# the first and last elements of the argument.

def missing(nums)
  (nums.first.to_i...nums.last.to_i).to_a - nums
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
p missing([]) == []
puts



# Alternate solution:
def missing((first, *nums, last))
  [*first.to_i.next...last.to_i] - nums
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
p missing([]) == []
p missing(nil) == []
puts



# Book solution:
def missing(arr)
  result = []
  arr.each_cons(2) { |n1, n2| result += (n1 + 1...n2).to_a }
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
p missing([]) == []
puts



# Alternate solution 2:
def missing((first, *nums, last))
  [*first.to_i + 1...last.to_i].reject { |n| nums.include?(n) }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
p missing([]) == []
puts




# Alternate solution 3:
def missing(arr)
  arr.each_cons(2).reduce([]) { |arr, (n1, n2)| arr + (n1 + 1...n2).to_a }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
p missing([]) == []
puts



# Alternate solution 4:
def missing(arr)
  arr.to_a.each_cons(2).reduce([]) { |arr, (n1, n2)| [*arr, *(n1.next...n2)] }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
p missing([]) == []
p missing(nil) == []
puts




# recursive:
def missing(arr)
  return [] if arr.to_a.size <= 1
  (arr.first + 1..arr[1] - 1).to_a + missing(arr.drop(1))
end

p missing([-3, -2, 1, 5]) # == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) # == []
p missing([1, 5]) # == [2, 3, 4]
p missing([6]) # == []
p missing([]) # == []
p missing(nil) # == []
puts





# class Foo
#   include Enumerable

#   def each
#     yield 1
#     yield 2, 3
#     yield
#   end
# end

# p Foo.new.each_entry { |obj| p obj } # #<Foo:0x00000001624e58>
# # 1
# # [2, 3]
# # nil
