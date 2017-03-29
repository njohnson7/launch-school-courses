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


class OCR
  NUMS =

  def initialize(text)
    @text = text
  end

  def convert

  end
end