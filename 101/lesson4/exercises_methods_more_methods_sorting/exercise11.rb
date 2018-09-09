# exercise11.rb

# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

p arr.sort { |a, b| b.to_i <=> a.to_i }


# solution 2:

p arr.sort_by(&:to_i).reverse


# solution 3:

p arr.sort_by { |n| -n.to_i }
