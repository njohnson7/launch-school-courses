# easy6_10.rb
# Right Triangles

# Write a method that takes a positive integer, n, as an argument, and displays
# a right triangle whose sides each have n stars. The hypotenuse of the triangle
# (the diagonal side in the images below) should have one end at the lower-left
# of the triangle, and the other end at the upper-right.

def triangle(n)
  n.times { |idx| puts ('*' * (idx + 1)).rjust(n) }
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****


triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********
puts '________________'
puts


# Alternate solution:
def triangle(n)
  n.times { |idx| puts (' ' * (n - (idx + 1))) + ('*' * (idx + 1)) }
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****


triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********
puts '________________'
puts


# Book solution:
def triangle(num)
  spaces = num - 1
  stars = 1
  num.times do
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****


triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********
puts '________________'
puts


# Try modifying your solution so it prints the triangle upside down from its
# current orientation. Try modifying your solution again so that you can display
# the triangle with the right angle at any corner of the grid.

def triangle(num)
  num.times { |idx| puts "#{' ' * (idx)}#{'*' * (num - idx)}"}
end

triangle(5)
triangle(9)
puts '________________'
puts


def triangle(num)
  num.times { |idx| puts ('*' * (num - idx)) }
end

triangle(5)
triangle(9)
puts '________________'
puts


def triangle(num)
  num.times { |idx| puts ('*' * (idx + 1)) }
end

triangle(5)
triangle(9)
