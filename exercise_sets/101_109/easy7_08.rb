# easy7_08.rb
# Multiply Lists

# Write a method that takes two Array arguments in which each Array contains a
#  list of numbers, and returns a new Array that contains the product of each
#  pair of numbers from the arguments that have the same index. You may assume
#  that the arguments contain the same number of elements.

def multiply_list(nums1, nums2)
  products = []
  nums1.each_with_index do |num, idx|
    products << num * nums2[idx]
  end
  products
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list([1, 3, 5, 9], [2, 4, 6, 12])
puts


# Alternate solution:
def multiply_list(nums1, nums2)
  nums1.map.with_index { |num, idx| num * nums2[idx] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list([1, 3, 5, 9], [2, 4, 6, 12])
puts


# Alternate solution 2:
def multiply_list(nums1, nums2)
  nums1.zip(nums2).map { |pair| pair.first * pair.last }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list([1, 3, 5, 9], [2, 4, 6, 12])
puts


# Alternate solution 3:
def multiply_list(nums1, nums2)
  products = []
  nums1.zip(nums2) { |pair| products << pair.reduce(:*) }
  products
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list([1, 3, 5, 9], [2, 4, 6, 12])
