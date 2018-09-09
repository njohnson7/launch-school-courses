# advanced1_04_transpose_mxn.rb
# Transpose MxN

# In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as
# represented by a ruby Array of Arrays.

# Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices.
# Any matrix can be transposed by simply switching columns with rows.

# Modify your transpose method from the previous exercise so it works with any
# matrix with at least 1 row and 1 column.

def transpose(matrix)
  matrix.each_with_index.with_object(Array.new(matrix.first.size) { [] }) \
  do |(row, row_idx), new_matrix|
    row.each_with_index { |e, column_idx| new_matrix[column_idx][row_idx] = e }
  end
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
puts


# Book solution:
def transpose(matrix)
  num_of_rows = matrix.size
  num_of_columns = matrix.first.size
  (0...num_of_columns).each_with_object([]) do |column_idx, new_matrix|
    new_matrix << (0...num_of_rows).map { |row_idx| matrix[row_idx][column_idx] }
  end
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
