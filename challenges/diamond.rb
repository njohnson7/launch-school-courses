# The diamond exercise takes as its input a letter, and outputs it in a diamond
# shape. Given a letter, it prints a diamond starting with 'A', with the
# supplied letter at the widest point.


# Requirements:
#     - first row contains one 'A'.
#     - last row contains one 'A'.
#     - all rows have exactly two identical letters, except for first and last,
#     - diamond is horizontally symmetric.
#     - diamond is vertically symmetric.
#     - diamond has a square shape (width equals height).
#     - letters form a diamond shape.
#     - top half has the letters in ascending order.
#     - bottom half has the letters in descending order.
#     - four corners (containing the spaces) are triangles.

# Examples

# Diamond for letter 'A':

# A

# Diamond for letter 'C':

#   A
#  B B
# C   C
#  B B
#   A

# Diamond for letter 'E':

#     A
#    B B
#   C   C
#  D     D
# E       E
#  D     D
#   C   C
#    B B
#     A


#  A
# B B
#  A

# algorithm:
#   num of top/bot rows = letter.ord - 65
#   line width and total num of rows = num of top rows * 2 + 1
#   row:  letter + spaces * ([line width - 2 - (offset * 2), 0].max).center(width)


# module Diamond
#   def self.make_diamond(letter)
#     letters = *'A'..letter
#     width = letters.size * 2 - 1
#     rows = make_rows(letters, width)
#     [rows.drop(1).reverse, rows].join
#   end

#   def self.make_rows(letters, width)
#     letters.reverse.map.with_index do |letter, offset|
#       spaces = width - 1 - (offset * 2)
#       "#{letter}#{letter[/[^A]/]&.rjust(spaces)}".center(width) + "\n"
#     end
#   end
# end

module Diamond
  def self.make_diamond(letter)
    width = (letter.ord - 65) * 2 + 1
    ('A'..letter).to_a.reverse.map.with_index do |letter, offset|
      spaces = width - 1 - (offset * 2)
      "#{letter}#{letter[/[^A]/]&.rjust(spaces)}".center(width) + "\n"
    end.tap { |rows| return [rows.drop(1).reverse, rows].join }
  end
end


p Diamond.make_diamond('A')
puts Diamond.make_diamond('B')
puts Diamond.make_diamond('C')
puts Diamond.make_diamond('D')
puts Diamond.make_diamond('E')
# puts Diamond.make_diamond('Z')
