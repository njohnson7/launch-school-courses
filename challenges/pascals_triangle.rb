# Write a program that computes Pascal's triangle up to a given number of rows.

# In Pascal's Triangle each number is computed by adding the numbers to the
# right and left of the current position in the previous row.

#               1         1
#              1 1        2
#             1 2 1       4
#            1 3 3 1      8
#           1 4 6 4 1    16
# ... etc

#

# class Triangle
#   attr_reader :rows

#   def initialize(row_num)
#     @rows = generate_rows(row_num)
#   end

#   def generate_rows(row_num)
#     rows = [[1]]
#     (2..row_num).each_with_index do |num, idx|
#       row = [1]
#       (0...num - 2).each do |n|
#         row << rows.last[n] + rows.last[n + 1]
#       end
#       row << 1
#       rows << row
#     end
#     rows
#   end
# end




# class Triangle
#   attr_reader :rows

#   def initialize(num_rows)
#     set_rows(num_rows)
#   end

#   def set_rows(num_rows, rows = [[1]])
#     return @rows = rows if rows.size == num_rows
#     row = (0..rows.size - 2).reduce([1]) { |row, i| row << rows.last[i, 2].sum } << 1
#     set_rows(num_rows, rows << row)
#   end
# end




# class Triangle
#   def initialize(num_rows)
#     @num_rows = num_rows
#   end

#   def rows(rows = [[1]])
#     return rows if rows.size == @num_rows
#     row = (0..rows.size - 2).reduce([1]) { |row, i| row << rows.last[i, 2].sum } << 1
#     rows(rows << row)
#   end
# end





Triangle = Struct.new(:num_rows) do
  def rows(rowz = [[1]])
    return rowz if rowz.size == num_rows
    rows(rowz << (0...rowz.size).reduce([1]) { |row, i| row << rowz.last[i, 2].sum })
  end
end


# Triangle = Struct.new(:n) do
#   def rows(r = [[1]])
#     r.size == n ? r : rows(r << (0...r.size).reduce([1]) { |w, i| [*w, r.last[i, 2].sum] })
#   end
# end



# p Triangle.new(3).rows
