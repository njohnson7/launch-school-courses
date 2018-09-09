# easy9_10_grocery_list.rb
# Grocery List

# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

def buy_fruit(list)
  list.map { |item, amount| [item] * amount }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
puts


# Alternate solution:
def buy_fruit(list)
  list.each_with_object([]) { |(item, n), ary| n.times { ary << item } }
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
