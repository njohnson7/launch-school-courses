# advanced1_02_seeing_stars.rb
# Seeing Stars

# Write a method that displays an 8-pointed star in an nxn grid, where n is an
# odd integer that is supplied as an argument to the method. The smallest such
# star you need to handle is a 7x7 grid.

def print_line(dist, n)
  puts dist != 0 ? ("*#{' ' * (dist - 1)}" * 2 + '*').center(n) : '*' * n
end

def star(n)
  max_distance = n / 2
  (-max_distance).upto(max_distance) { |d| print_line(d.abs, n) }
end

star(7)
# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
puts

star(9)
# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *
puts

star(15)
