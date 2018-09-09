# easy2_02.rb

# def zip(arr1, arr2)
#   arr1.map.with_index { |elem, idx| [elem, arr2[idx]] }
# end

def zip(arr1, arr2)
  (0...arr1.size).map { |idx| [arr1[idx], arr2[idx]] }
end

def zip(arr1, arr2)
  return [] if arr1.empty?
  [[arr1.first, arr2.first]] + zip(arr1.drop(1), arr2.drop(1))
end

# recursive:
def zip(arr1, arr2)
  return [] if arr1.empty?
  [[arr1, arr2].map(&:first)] + zip(arr1.drop(1), arr2.drop(1))
end

# recursive - using splat operator:
def zip(*arrs)
  return [] if arrs.any?(&:empty?)
  [arrs.map(&:first)] + zip(arrs.first.drop(1), arrs.last.drop(1))
end

# def zip(*arrs)
#   arrs.transpose
# end

# using Enumerable#reduce:
def zip(arr1, arr2)
  arr1.each_with_index.reduce([]) { |result, (el, idx)| result << [el, arr2[idx]] }
end

p zip([1, 2, 3], [4, 5, 6]) #== [[1, 4], [2, 5], [3, 6]]
p zip(%w[a b c], %w[Xx Yyy ZzZ])
p zip(%w[a b], %w[Xx Yyy])
p zip(%w[a b c e f g], %w[x y z 1 2 3])
