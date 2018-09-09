# easy3_07.rb
# Odd Lists

# Write a method that returns an Array that contains every other element of
#  an Array that is passed in as an argument. The values in the returned list
#  should be those values that are in the 1st, 3rd, 5th, and so on elements of
#  the argument Array.

# Examples:

# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []

def oddities(ary)
  ary.select.with_index { |elem, idx| idx.even? }
end

p oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
p oddities(['abc', 'def']) #== ['abc']
p oddities([123]) #== [123]
p oddities([]) #== []
puts


# Book solution:
def oddities(ary)
  (0...ary.size).step(2).map { |idx| ary[idx] }
end

p oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
p oddities(['abc', 'def']) #== ['abc']
p oddities([123]) #== [123]
p oddities([]) #== []
puts


# Write a companion method that returns the 2nd, 4th, 6th, and so on elements
 # of an array. Try rewriting your oddities method using a different set of
 # method calls.

def evenities(ary)
  evens = []
  ary.each_with_index { |elem, idx| evens << elem if idx % 2 == 1 }

  evens
end

p evenities([2, 3, 4, 5, 6])
p evenities(['abc', 'def'])
p evenities([123])
p evenities([])
