# easy7_09.rb
# Multiply All Pairs

# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of every
# pair of numbers that can be formed between the elements of the two Arrays. The
# results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

def multiply_all_pairs(nums1, nums2)
  products = []
  nums1.each do |n1|
    nums2.each do |n2|
      products << n1 * n2
    end
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
puts


# Book solution:
def multiply_all_pairs(nums1, nums2)
  nums1.product(nums2).map { |pair| pair.reduce(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
puts


# Alternate solution:
def multiply_all_pairs(nums1, nums2)
  nums1.each_with_object([]) { |n1, r| nums2.each { |n2| r << n1 * n2 } }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
