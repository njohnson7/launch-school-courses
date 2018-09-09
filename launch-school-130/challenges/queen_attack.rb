# In the game of chess, a queen can attack pieces which are on the same row,
# column, or diagonal.

# A chessboard can be represented by an 8 by 8 array.

# So if you're told the white queen is at (2, 3) and the black queen at (5, 6),
# then you'd know you've got a set-up like so:

#      0 1 2 3 4 5 6 7   < Y
#   0  _ _ _ _ _ _ _ _
#   1  _ _ _ _ _ _ _ _
#   2  _ _ _ W _ _ _ _   [2, 3]
#   3  _ _ _ _ X _ _ _
#   4  _ _ _ _ _ _ _ _
#   5  _ _ _ _ _ _ B _   [5, 6]
#   6  _ _ _ _ _ _ _ _
#   7  Z _ _ _ _ _ _ _

#   ^
#   X

# You'd also be able to answer whether the queens can attack each other. In this
# case, that answer would be yes, they can, because both pieces share a
# diagonal.

# rules:
  # can queens attack?
    # yes if:   x == x,    y == y,   (x2 - x1).abs == (y2 - y1).abs


class Queens
  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = Queen.new('W', *white)
    @black = Queen.new('B', *black)
  end

  def white
    @white.position
  end

  def black
    @black.position
  end

  def to_s
    Board.draw(@white, @black)
  end

  def attack?
    @white.attack?(@black)
  end
end

Queen = Struct.new(:color, :x, :y) do
  def attack?(other)
    x == other.x || y == other.y || (x - other.x).abs == (y - other.y).abs
  end

  def position
    [x, y]
  end
end

module Board
  def self.draw(*queens)
    rows = Array.new(8) { ['_'] * 8 }
    queens.each { |queen| rows[queen.x][queen.y] = queen.color }
    rows.map { |row| row.join(' ') }.join("\n")
  end
end









Queens = Struct.new(:white, :black) do
  def initialize(queens = { white: [0, 3], black: [7, 3] })
    self.white, self.black = queens.values.tap { |w, b| raise ArgumentError if w == b }
    @board = Array.new(8) { ['_'] * 8 }
    queens.each { |color, (x, y)| @board[x][y] = color.to_s[0].upcase }
  end

  def to_s
    @board.map { |row| row.join(' ') }.join("\n")
  end

  def attack?
    x_y = [white, black].transpose
    x_y.any? { |a, b| a == b } || x_y.map { |a, b| (a - b).abs }.uniq.size == 1
  end
end





# Queens = Struct.new(:white, :black) do
#   def initialize(queens = { white: [0, 3], black: [7, 3] })
#     self.white, self.black = queens.values.tap { |a, b| raise ArgumentError if a == b }
#     # @board = Array.new(8) { Array.new(8) { '_' } }
#     # queens.each { |queen, (x, y)| @board[x][y] = queen.to_s[0].upcase }

#     # queens.reduce('_' * 64) { ||}

#     board = '_' * 64
#     queens.each { |queen, (x, y)| board[x * 8 + y] = queen.to_s[0].upcase }
#     @board = board.chars.join(' ').gsub(/(.{15})/, "\\1\n")
#   end

#   def to_s
#     @board

#     # board = '_' * 64


#     # @board.map { |row| row.join(' ') }.join("\n")
#   end

#   def attack?
#     [:first, :last, -> (a, b) { (a - b).abs }].any? do |block|
#       [white, black].map(&block).uniq.size == 1
#     end
#   end
# end







# class Board
#   def initialize(*queens)
#     @rows = Array.new(8) { ['_'] * 8 }
#     queens.each { |queen| @rows[queen.x][queen.y] = queen.color }
#   end

#   def to_s
#     @rows.map { |row| row.join(' ') }.join("\n")
#   end
# end
