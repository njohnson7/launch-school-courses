# easy5_08.rb
# Alphabetical Numbers

# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

NUMS_TO_WORDS = %w(
  zero one two three four five six seven eight nine ten eleven
  twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen
)

def alphabetic_number_sort(ary)
  ary.map { |n| NUMS_TO_WORDS[n] }.sort.map { |word| NUMS_TO_WORDS.index(word) }
end

p alphabetic_number_sort((0..19).to_a)
# => [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]
puts


# Book solution:
def alphabetic_number_sort(nums)
  nums.sort_by { |num| NUMS_TO_WORDS[num] }
end

p alphabetic_number_sort((0..19).to_a)
puts


# Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?

# For an extra challenge, rewrite your method to use Enumerable#sort
#  (unless you already did so).

# sort_by! mutates the caller, and since mutating the caller isn't necessary for
#  the proper functioning of this method, it's better to use a non-destructive
#  method to avoid side effects.

def alphabetic_number_sort(nums)
  nums.sort { |num1, num2| NUMS_TO_WORDS[num1] <=> NUMS_TO_WORDS[num2] }
end

p alphabetic_number_sort((0..19).to_a)
