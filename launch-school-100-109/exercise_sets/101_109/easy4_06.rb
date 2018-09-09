# easy4_06.rb
# Running Totals

# Write a method that takes an Array of numbers, and returns an Array with the
#  same number of elements, and each element has the running total from the
#  original Array.

# Examples:

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

def running_total(ary)
  totals = []
  totals << ary.reduce do |sum, num|
    totals << sum
    sum + num
  end

  totals.compact
end

p running_total([2, 5, 13]) #=> [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #=> [14, 25, 32, 47, 67]
p running_total([3]) #=> [3]
p running_total([]) #=> []
puts


# Alternate solution:
def running_total(ary)
  totals = []
  sum = 0
  ary.each { |num| totals << sum += num }

  totals
end

p running_total([2, 5, 13]) #=> [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #=> [14, 25, 32, 47, 67]
p running_total([3]) #=> [3]
p running_total([]) #=> []
puts


# Book solution:
def running_total(ary)
  sum = 0
  ary.map { |num| sum += num }
end

p running_total([2, 5, 13]) #=> [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #=> [14, 25, 32, 47, 67]
p running_total([3]) #=> [3]
p running_total([]) #=> []
puts


# Try solving this problem using Array#each_with_object or Enumerable#inject
#  (note that Enumerable methods can be applied to Arrays).

def running_total(ary)
  sum = 0
  ary.each_with_object([]) { |num, ary| ary << sum += num}
end

p running_total([2, 5, 13]) #=> [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #=> [14, 25, 32, 47, 67]
p running_total([3]) #=> [3]
p running_total([]) #=> []
