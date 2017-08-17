


Triangle = Struct.new(:num_rows) do
  def rows(rowz = [[1]])
    return rowz if rowz.size == num_rows
    rows(rowz << (0...rowz.size).reduce([1]) { |row, i| row << rowz.last[i, 2].sum })
  end
end

p triangle = Triangle.new(20).rows