# Write a program that, given a 3 x 4 grid of pipes, underscores, and spaces,
# can determine which number is represented, or whether it is garbled.

# ____Step One____
# To begin with, convert a simple binary font to a string containing 0 or 1. The
# binary font uses pipes and underscores, four rows high and three columns wide.
#  _   #
# | |  # zero.
# |_|  #
#      # the fourth row is always blank   # =>  Is converted to "0"

#    #
# |  # one.
# |  #
#    # (blank fourth row)    # => Is converted to "1"

# If the input is the correct size, but not recognizable, your program should
# return '?'. If the input is the incorrect size, your program should return an
# error.

# ____Step Two____
# Update your program to recognize multi-character binary strings, replacing
# garbled numbers with ?

# ____Step Three____
# Update your program to recognize all numbers 0 through 9, both individually
# and as part of a larger string.
#  _
#  _|
# |_      # => Is converted to "2"

#   _  _     _  _  _  _  _  _  #
# | _| _||_||_ |_   ||_||_|| | # decimal numbers.
# ||_  _|  | _||_|  ||_| _||_| #
#                              # fourth line is always blank
# - Is converted to "1234567890"

# ____Step Four____
# Update your program to handle multiple numbers, one per line. When converting
# several lines, join the lines with commas.
#     _  _
#   | _| _|
#   ||_  _|

#     _  _
# |_||_ |_
#   | _||_|

#  _  _  _
#   ||_||_|
#   ||_| _|   # =>  Is converted to "123,456,789"

# rules:
  # each num represented by 4 row x 3 column grid of pipes, underscores, and spaces
  # raise error if input is incorrect size
  # numbers: 0-9
  # replace garbled nums w/ '?'
    # garbled = correct size, but unrecognizable
  # be able to recognize multiple numbers on multiple 4-lines
# algorithm:
  # determine if size is valid
    # check first 3 rows:
      # num of chars from beginning of line to end of line -> num_chars % 3 == 0
        # EXCEPTION: top row -> num_chars + 1 % 3 == 0   (short by 1!)
          # top row must end in '_'
          # EXCEPTION: 5, 6 in middle row are short by 1, and end in '_' also
    # check if num rows % 4 == 0
      # 3 "\n" chars
      # 3rd row ends w/ "\n"
  # garbled?
    # 4th row is not empty?
  # extract nums
    # split into rows -> text.scan(/.+\n/)   (includes newline char)
      # check for validity:
        # rows.map(&:size) # => [30, 31, 31]  OR  [30, 30, 30]
        # all end with "\n"
      # split up into sub arrays of 3 rows:
        # ex: text.scan(/.+\n/).each_slice(3).to_a
    # scan every 3 chars of every line
      # chunks = row_slices.map { |slice| slice.map { |str| str.scan(/...?/) } }
      # nums = chunks.map { |a, b, c| a.zip(b, c) }
    # change arr nums to string nums:
      # nums.map { |arr| arr.map { |n| NUMS.fetch(n, '?') } }
    # join nums on same line, and separate lines:
      # nums.map { |arr| arr.map { |n| NUMS.fetch(n, '?') }.join }.join(',')

# class OCR
#   NUMS = { [ " _ ", "| |", "|_|" ] => '0', [ "   ", "  |", "  |" ] => '1',
#            [ " _ ", " _|", "|_ " ] => '2', [ " _ ", " _|", " _|" ] => '3',
#            [ "   ", "|_|", "  |" ] => '4', [ " _ ", "|_ ", " _|" ] => '5',
#            [ " _ ", "|_ ", "|_|" ] => '6', [ " _ ", "  |", "  |" ] => '7',
#            [ " _ ", "|_|", "|_|" ] => '8', [ " _ ", "|_|", " _|" ] => '9' }
# #
#   def initialize(text)
#     # @text = text.gsub(/^\n(?!\n)/, "   \n")
#     # @text = text.gsub(/^\n/, "   \n").gsub("   \n\n", "\n\n")
#     @text = text.gsub(/^\n/, "   \n").gsub("\n   \n", "\n\n")
#       # ;require'pry';binding.pry;
#     # @text = text
#   end

#   def convert
#     row_slices = @text.scan(/.+\n/).each_slice(3).to_a
#     # raise ArgumentError unless valid?(row_slices)
#     chunks = row_slices.map do |slice|
#       slice.map { |string| string.scan(/...?/).map { |str| str.ljust(3) } }
#       # slice.map { |string| string.scan(/...?|(?!\n)/).map { |str| str.ljust(3) } }.map(&:first)
#     end
#       # ;require'pry';binding.pry;
#     num_arrs = chunks.map { |top, mid, bot| top.zip(mid, bot) }
#     num_arrs.map { |num_arr| num_arr.map { |n| NUMS.fetch(n, '?') }.join }.join(',')
#   end

#   def valid?(row_slices)
#       # ;require'pry';binding.pry;
#     return false unless row_slices.all? do |slice|
#       slice.all? { |row| row.end_with?("\n") }
#     end
#     return false unless row_slices.all? { |slice| slice.size == 3 }



#     tops, *mids_bots = row_slices.map { |slice| slice.map(&:size) }.transpose
#     tops.all? { |size| (size % 3).zero? } &&
#       mids_bots.flatten.all? { |size| size % 3 != 2 }
#   end
# end



# class OCR
#   NUMS = { [ ' _ ', '| |', '|_|' ] => '0', [ '   ', '  |', '  |' ] => '1',
#            [ ' _ ', ' _|', '|_ ' ] => '2', [ ' _ ', ' _|', ' _|' ] => '3',
#            [ '   ', '|_|', '  |' ] => '4', [ ' _ ', '|_ ', ' _|' ] => '5',
#            [ ' _ ', '|_ ', '|_|' ] => '6', [ ' _ ', '  |', '  |' ] => '7',
#            [ ' _ ', '|_|', '|_|' ] => '8', [ ' _ ', '|_|', ' _|' ] => '9' }
# #
#   def initialize(text)
#     @text = text.gsub(/^\n/, "   \n").gsub("\n   \n", "\n\n")
#   end

#   def convert
#     row_slices = @text.scan(/.+\n/).each_slice(3).to_a
#     raise ArgumentError unless valid?(row_slices)
#     chunks = row_slices.map do |slice|
#       slice.map { |string| string.scan(/...?/).map { |str| str.ljust(3) } }
#     end
#     num_arrs = chunks.map { |top, mid, bot| top.zip(mid, bot) }
#     num_arrs.map { |num_arr| num_arr.map { |n| NUMS.fetch(n, '?') }.join }.join(',')
#   end

#   def valid?(row_slices)
#     row_slices.all? { |slice| slice.all? { |row| row.end_with?("\n") } }
#   end
# end



class OCR
  NUMS = { [ ' _ ', '| |', '|_|' ] => '0', [ '   ', '  |', '  |' ] => '1',
           [ ' _ ', ' _|', '|_ ' ] => '2', [ ' _ ', ' _|', ' _|' ] => '3',
           [ '   ', '|_|', '  |' ] => '4', [ ' _ ', '|_ ', ' _|' ] => '5',
           [ ' _ ', '|_ ', '|_|' ] => '6', [ ' _ ', '  |', '  |' ] => '7',
           [ ' _ ', '|_|', '|_|' ] => '8', [ ' _ ', '|_|', ' _|' ] => '9' }
#
  def initialize(text)
    @text = text.gsub(/^\n/, "   \n").gsub("\n   \n", "\n\n")
  end

  def convert
    row_slices = @text.scan(/.+\n/).each_slice(3).to_a
    chunks = row_slices.map do |slice|
      slice.map { |string| string.scan(/...?/).map { |str| str.ljust(3) } }
    end
    num_arrs = chunks.map { |top, mid, bot| top.zip(mid, bot) }
    num_arrs.map { |num_arr| num_arr.map { |n| NUMS.fetch(n, '?') }.join }.join(',')
  end
end





    text = <<-NUMBER.chomp
    _  _
  | _| _|
  ||_  _|

    _  _
|_||_ |_
  | _||_|

 _  _  _
  ||_||_|
  ||_| _|

NUMBER
p OCR.new(text).convert

    text2 = <<-NUMBER.chomp

  |
  |

    NUMBER
p OCR.new(text2).convert