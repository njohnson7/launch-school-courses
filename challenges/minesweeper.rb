# Minesweeper is a popular game where the user has to find the mines using
# numeric hints that indicate how many mines are directly adjacent
# (horizontally, vertically, diagonally) to a square.

# In this exercise you have to create some code that counts the number of mines
# adjacent to a square and transforms boards like this (where * indicates a
# mine):

#    +-----+
#    | * * |
#    |  *  |
#    |  *  |
#    |     |
#    +-----+

# into this:

#    +-----+
#    |1*3*1|
#    |13*31|
#    | 2*2 |
#    | 111 |
#    +-----+

ValueError = Class.new(StandardError)

module Board
  def self.transform(rows)
    raise ValueError unless valid?(rows)
    rows.map.with_index do |row, row_idx|
      next row if row.start_with?('+')
      row.chars.map.with_index do |char, column_idx|
        next char if char.match?(/[|*+-]/)
        count = 0
        count += 1 if row[column_idx - 1] == '*'
        count += 1 if row[column_idx + 1] == '*'
        count += 1 if rows[row_idx - 1][column_idx] == '*'
        count += 1 if rows[row_idx - 1][column_idx - 1] == '*'
        count += 1 if rows[row_idx - 1][column_idx + 1] == '*'
        count += 1 if rows[row_idx + 1][column_idx] == '*'
        count += 1 if rows[row_idx + 1][column_idx - 1] == '*'
        count += 1 if rows[row_idx + 1][column_idx + 1] == '*'
        count.nonzero? ? count : char
      end.join
    end
  end

  def self.valid?((top, *mid, bot))
    [top, *mid, bot].map(&:size).uniq.size == 1 &&
      [top, bot].all? { |row| row.match?(/\A\+-+\+\z/) } &&
      mid.all? { |row| row.match(/\|[ *]+\|/)}
  end
end

    inp = ['+-----+', '|     |', '|   * |', '|     |', '|     |',
           '| *   |', '+-----+']
p Board.transform(inp)