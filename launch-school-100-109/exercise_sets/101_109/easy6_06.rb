# easy6_06.rb
# Combining Arrays

# Write a method to that takes two Arrays as arguments, and returns an Array
#  that contains all of the values from the argument Arrays. There should be no
#  duplication of values in the returned Array, even if there are duplicates in
#  the original Arrays.

def merge(ary1, ary2)
  (ary1 + ary2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) #=> [1, 3, 5, 6, 9]
p merge([1, 3, 5, 3, 1, 4], [3, 6, 9, 4]) #=> [1, 3, 5, 4, 6, 9]
p merge([1,2,3,4,5,6,5,4,3,3,3,2,0], [1,5,2,7,3,9,1,4,3,2,9])
puts


# Alternate solution:
def merge(ary1, ary2)
  ary1 | ary2
end

p merge([1, 3, 5], [3, 6, 9]) #=> [1, 3, 5, 6, 9]
p merge([1, 3, 5, 3, 1, 4], [3, 6, 9, 4]) #=> [1, 3, 5, 4, 6, 9]
p merge([1,2,3,4,5,6,5,4,3,3,3,2,0], [1,5,2,7,3,9,1,4,3,2,9])
puts

# Alternate solution 2:
def merge(ary1, ary2)
  new_ary = []
  (ary1 + ary2).each { |elem| new_ary << elem unless new_ary.include?(elem) }
  new_ary
end

p merge([1, 3, 5], [3, 6, 9]) #=> [1, 3, 5, 6, 9]
p merge([1, 3, 5, 3, 1, 4], [3, 6, 9, 4]) #=> [1, 3, 5, 4, 6, 9]
p merge([1,2,3,4,5,6,5,4,3,3,3,2,0], [1,5,2,7,3,9,1,4,3,2,9])
puts


# Alternate solution 3:
def merge(ary1, ary2)
  ary1.concat(ary2)
  (0...ary1.size).each do |idx|
    ary1.insert(idx, ary1.delete(ary1[idx])) if ary1.count(ary1[idx]) > 1
  end

  ary1
end

p merge([1, 3, 5], [3, 6, 9]) #=> [1, 3, 5, 6, 9]
p merge([1, 3, 5, 3, 1, 4], [3, 6, 9, 4]) #=> [1, 3, 5, 4, 6, 9]
p merge([1,2,3,4,5,6,5,4,3,3,3,2,0], [1,5,2,7,3,9,1,4,3,2,9])
