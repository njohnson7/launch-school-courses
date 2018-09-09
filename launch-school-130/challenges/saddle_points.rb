# It's called a "saddle point" because it is greater than or equal to every
# element in its row and the less than or equal to every element in its column.

# A matrix may have zero or more saddle points.


#        0  1  2     < y
#      |---------
#    0 | 9  8  7
#    1 | 5  3  2     <--- saddle point (num 5) at (x: 1, y: 0)
#    2 | 6  6  7

#    ^
#    x

# input: str of nums representing a matrix
  # nums separated by spaces and rows separated by newlines
# output:
  # .rows:           rows of matrix as a 2d array
  # .columns:        columns of matrix as a 2d array
  # .saddle_points:  2d array of [x, y] coords of saddle points (0+ elems)
      # n >= every elem in its row
      # n <= every elem in its column
# algorithm:
  # turn input str into 2d array of rows of Integers
  # iterate over each num using index, checking if num is a saddle point
    # row:
    # store [x, y] in result arr if so


Matrix = Struct.new(:rows, :columns) do
  def initialize(str)
    self.rows = str.split("\n").map { |row| row.split.map(&:to_i) }
    self.columns = rows.transpose
  end

  def saddle_points
    rows.each_with_index.with_object([]) do |(row, x), result|
      row.each_with_index do |num, y|
        result << [x, y] if (row[0...y] + row[y + 1..-1]).all? { |n| num >= n } &&
          (columns[y][0...x] + columns[y][x + 1..-1]).all? { |n| num <= n }
      end
    end
  end
end


Matrix = Struct.new(:rows, :columns) do
  def initialize(str)
    self.rows = str.split("\n").map { |row| row.split.map(&:to_i) }
    self.columns = rows.transpose
  end

  def saddle_points
    result = []
    row_maxes = rows.map(&:max)
    column_mins = columns.map(&:min)
    rows.each_with_index do |row, x|
      row.each_with_index do |num, y|
        result << [x, y] if num.between?(row_maxes[x], column_mins[y])
      end
    end
    result
  end
end





Matrix = Struct.new(:rows, :columns) do
  def initialize(str)
    self.rows = str.split("\n").map { |row| row.split.map(&:to_i) }
    self.columns = rows.transpose
  end

  def saddle_points
    mins = columns.map(&:min)
    rows.map(&:max).each_with_index.with_object([]) do |(max, x), result|
      (y = mins.index(max)) && result << [x, y]
    end
  end
end
