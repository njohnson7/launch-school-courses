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


module Board
  def self.transform(rows)
    raise ValueError unless valid?(rows)
    rows.map.with_index do |row, x|
      row.chars.map.with_index do |char, y|
        next char if char.match?(/[+-|*]/)
        mine_count = rows[x - 1..x + 1].reduce(0) do |count, sub_row|
          count + sub_row[y - 1..y + 1].count('*')
        end
        mine_count.nonzero? ? mine_count : char
      end.join
    end
  end

  def self.valid?((top, *mid, bot))
    [top, *mid, bot].map(&:size).uniq.size == 1 &&
      top == bot && bot.match?(/\A\+-+\+\z/) &&
      mid.all? { |row| row.match?(/\A\|[ *]+\|\z/)}
  end
end

ValueError = Class.new(StandardError)


#     inp = ['+-----+', '|     |', '|   * |', '|     |', '|     |',
#            '| *   |', '+-----+']
# p Board.transform(inp)
