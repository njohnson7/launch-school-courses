# # digits must add up to sum
# # ascending order
# def find_all(sum, num_digits)
#   start = ('1' * num_digits).to_i
#   count = 0
#   min = nil
#   max = nil
#   (start...start * 10).select do |num|
#     digits = num.to_s.chars.map(&:to_i)
#     if digits == digits.sort && digits.reduce(:+) == sum
#       min ||= num
#       max = num
#       count += 1
#     end
#   end
#   min ? [count, min, max] : []
# end

# def increasing(digits)

# end

# def find_all(sum, num_digits)
#   start = ('1' * num_digits).to_i
#   return [] if 9 * num_digits < sum

# end

# # [total amount of possible nums, min, max]
# p find_all(10, 3) ==
#                      [8, 118, 334]
#                    # [118, 127, 136, 145, 226, 235, 244, 334]

# p find_all(27, 3) ==
#                      [1, 999, 999]

# p find_all(84, 4) ==
#                      []

# # p find_all(35, 6) ==
#                      # [123, 116999, 566666]

# # 111, 112, 113, 114, 115, 116, 117, 118, 119,
# # 122, 123, 124, 125, 126, 127, 128, 129

# [ 111, 112, 113, 114, 115, 116, 117, 118, 119, #
#        122, 123, 124, 125, 126, 127, 128, 129, #  3
#             133, 134, 135, 136, 137, 138, 139, #  4
#                  144, 145, 146, 147, 148, 149, #  5
#                       155, 156, 157, 158, 159, #  6
#                            166, 167, 168, 169, #  7
#                                 177, 178, 179, #  8
#                                      188, 189, #  9
#                                           199, # 10
#        222, 223, 224, 225, 226, 227, 228, 229, # 23
#             233, 234, 235, 236, 237, 238, 239, #  4
#                  244, 245, 246, 247, 248, 249, #  5
#                       255, 256, 257, 258, 259, #  6
#                            266, 267, 268, 269, #  7
#                                 277, 278, 279, #  8
#                                      288, 289, #  9
#                                           299, # 10
#             333, 334, 335, 336, 337, 338, 339, # 34
#                  344, 345, 346, 347, 348, 349, #  5
#                       355, 356, 357, 358, 359, #  6
#                            366, 367, 368, 369,
#                                 377, 378, 379,
#                                      388, 389,
#                                           399, # 10
#                  444, 445, 446, 447, 448, 449, # 45
#                       455, 456, 457, 458, 459,
#                            466, 467, 468, 469,
#                                 477, 478, 479,
#                                 488, 489, 499, # 10
#                       555, 556, 557, 558, 559, # 56
#                            566, 567, 568, 569,
#                                 577, 578, 579,
#                                      588, 589,
#                                           599,
#                            666, 667, 668, 669, # 67
#                                 677, 678, 679,
#                                      688, 689,
#                                           699,
#                                 777, 778, 779, # 78
#                                      788, 789,
#                                           799,
#                                      888, 889, # 89
#                                           899, # 10
#                                           999 ]# 100
# # p a.size
# # every num that ends in a 9
# def sequential_nums(min, max)
#   result = []
#   ('1'..'9').each do |n1|
#     ('1'..'9').each do |n2|
#       next unless n2 >= n1
#       ('1'..'9').each do |n3|
#         next unless n3 >= n2
#         result << "#{n1}#{n2}#{n3}"
#       end
#     end
#   end
#   result
# end

# p sequential_nums(1, 1).size





def wave(str)
  (0...str.size).map { |idx| str[0...idx] + str[idx].upcase + str[idx + 1..-1] }
                .reject { |s| s == s.downcase }
end

# result = ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# wave("hello")

# result = ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
# wave("codewars")

# result = []
# wave("")

# result = ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
# wave("two words")

# result = [" Gap ", " gAp ", " gaP "]
# wave(" gap ")





def sel_reverse(arr, size)
  size < 2 ? arr : arr.each_slice(size).flat_map(&:reverse)
end

# sel_reverse([2,4,6,8,10,12,14,16], 3) ==
# [6,4,2, 12,10,8, 16,14]
# sel_reverse([2,4,6,8,10,12,14,16], 2) ==
# [4,2, 8,6, 12,10, 16,14]
# sel_reverse([1,2,3,4,5,6], 2) ==
# [2,1, 4,3, 6,5]
# sel_reverse([1,2,3,4,5,6], 0) ==
# [1,2,3,4,5,6]
# sel_reverse([1,2,3,4,5,6], 10) ==
# [6,5,4,3,2,1]






def missing_alphabets(str)
  max = 0
  str.chars.uniq.each do |char|
    count = str.count(char)
    max = count if count > max
  end
  ('a'..'z').reduce('') { |result, char| result + (char * (max - str.count(char))) }
end


p missing_alphabets("abcdefghijklmnopqrstuvwxy") ==
 "z"
p missing_alphabets("abcdefghijklmnopqrstuvwxyz") ==
 ""
p missing_alphabets("aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyy") ==
 "zz"
p missing_alphabets("abbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxy") ==
 "ayzz"
p missing_alphabets("codewars") ==
 "bfghijklmnpqtuvxyz"