# exercise5.rb


# Given this data structure, return an new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate) in
# descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

ordered = arr.map { |sub_arr| sub_arr.sort { |a, b| b <=> a } }
p ordered


# Solution 2:
ordered = arr.map { |sub_arr| sub_arr.sort.reverse }
p ordered


# Solution 3:
ordered = arr.map { |sub_arr| sub_arr.sort_by(&:itself).reverse }
p ordered