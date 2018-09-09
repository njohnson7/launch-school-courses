# exercise12.rb
# Given this data structure, and without using the Array#flatten
# method, write some code to return a new array containing all of the items in
# the original array but in a flat structure.

arr = [['stars', 'river'], 'letter', ['leaves', ['horses', 'table']]]

p arr.join(' ').split

b = [1,
     [2, 3],
     [4, 5, [6, 7, [ 8, 9 ], 10] ],
     11, [ 12, [ 13, 14 ], 15 ],
     16]
p b.join(' ').split.map(&:to_i)
puts


# solution 2:
def flattin(items, flattened = [])
  items.each_with_object(flattened) do |item, flat|
    item.is_a?(Array) ? flattin(item, flat) : flat << item
  end
end

arr = [['stars', 'river'], 'letter', ['leaves', ['horses', 'table']]]
p flattin(arr)

b = [1,
     [2, 3],
     [4, 5, [6, 7, [ 8, 9 ], 10] ],
     11, [ 12, [ 13, 14 ], 15 ],
     16]
p flattin(b)
puts



# solution 3:
def flattin(items)
  items.reduce([]) do |flat, item|
    flat + (item.is_a?(Array) ? flattin(item) : [item])
  end
end

arr = [['stars', 'river'], 'letter', ['leaves', ['horses', 'table']]]
p flattin(arr)

b = [1,
     [2, 3],
     [4, 5, [6, 7, [ 8, 9 ], 10] ],
     11, [ 12, [ 13, 14 ], 15 ],
     16]

p flattin(b)