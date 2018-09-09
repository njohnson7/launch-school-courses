# advanced1_03_transpose_3x3.rb
# Transpose 3x3

# A 3 x 3 matrix can be represented by an Array of Arrays in which the main
# Array and all of the sub-Arrays has 3 elements. For example:

# 1  5  8
# 4  7  2
# 3  9  6

# can be described by the Array of Arrays:

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# An Array of Arrays is sometimes call nested arrays because each of the inner
# Arrays is nested inside an outer Array.

# To access an element in matrix, you use Array#[] with both the row index and
# column index. So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9. An
# entire row in the matrix can be referenced by just using one index: matrix[1]
# is the row (an Array) [4, 7, 2]. Unfortunately, there's no convenient notation
# for accessing an entire column.

# The transpose of an 3 x 3 matrix is the matrix that results from exchanging
# the columns and rows of the original matrix. For example, the transposition of
# the array shown above is:

# transposed:       original:
#     1  4  3         1  5  8
#     5  7  9         4  7  2
#     8  2  6         3  9  6


# indices:
#     00 10 20         00 01 02
#     01 11 21         10 11 12
#     02 12 22         20 21 22

# swap:
#     .  X  X
#     .  .  X
#     .  .  .
#  01, 02, 12

# indices if flattened:
#     0  3  6          0  1  2
#     1  4  7          3  4  5
#     2  5  8          6  7  8

# swap:     3,1   6,2   7,5

# transposed:  0, 3, 6, 1, 4, 7, 2, 5, 8
# original:    0, 1, 2, 3, 4, 5, 6, 7, 8

# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns
# the transpose of the original matrix. Note that there is a Array#transpose
# method that does this -- you may not use it for this exercise. You also are
# not allowed to use the Matrix class from the standard library. Your task is to
# do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and
# leave the original matrix unchanged.

def transpose(matrix)
  [
    [matrix[0][0], matrix[1][0], matrix[2][0]],
    [matrix[0][1], matrix[1][1], matrix[2][1]],
    [matrix[0][2], matrix[1][2], matrix[2][2]]
  ]
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
puts


# Alternate solution:
def transpose(matrix)
  new_matrix = [[],[],[]]
  0.upto(2) do |idx2|
    0.upto(2) { |idx1| new_matrix[idx2] += [matrix[idx1][idx2]] }
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
puts


# Alternate solution 2:
def transpose(matrix)
  3.times.with_object([]) do |idx, new_matrix|
    new_matrix << [matrix[0][idx], matrix[1][idx], matrix[2][idx]]
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
puts


# Alternate solution 3:
def transpose(matrix)
  3.times.with_object([]) do |idx, new_matrix|
    3.times { |idx2| new_matrix << matrix[idx2][idx] }
  end.each_slice(3).to_a
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
puts


# Alternate solution 4:
def transpose(matrix)
  (0..2).each_with_object([]) do |idx, new_matrix|
    new_matrix << [matrix.dig(0, idx), matrix.dig(1, idx), matrix.dig(2, idx)]
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
puts


# Alternate solution 5:
def transpose(matrix)
  matrix.first.zip(matrix[1], matrix.last)
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
puts


# Book solution:
def transpose(matrix)
  (0..2).each_with_object([]) do |column_idx, new_matrix|
    new_matrix << (0..2).map { |row_idx| matrix.dig(row_idx, column_idx) }
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
puts '___________________'


# Write a transpose! method that transposes a method in place. The obvious
# solution is to reuse transpose from above, then copy the results back into the
# array specified by the argument. For this method, don't use this approach;
# write a method from scratch that does the in-place transpose.
def transpose!(matrix)
  matrix[0][1], matrix[1][0] = matrix[1][0], matrix[0][1]
  matrix[0][2], matrix[2][0] = matrix[2][0], matrix[0][2]
  matrix[1][2], matrix[2][1] = matrix[2][1], matrix[1][2]
  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
new_matrix = transpose!(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
puts


# Alternate solution:
def transpose!(matrix)
  indices = [[0, 1], [0, 2], [1, 2]]
  indices.each do |set|
    matrix[set.first][set.last], matrix[set.last][set.first] =
      matrix.dig(*set.reverse), matrix.dig(*set)
  end
  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
new_matrix = transpose!(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
