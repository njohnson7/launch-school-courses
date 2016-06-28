# medium1_05.rb
# Diamonds!

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method. You may assume
# that the argument will always be an odd integer.

def diamond(num)
  top_bottom_lines = []
  (2..num - 1).step(2) do |n|
    num_of_stars = num - n
    num_of_spaces = n / 2
    top_bottom_lines << ' ' * num_of_spaces + '*' * num_of_stars + ' ' * num_of_spaces
  end
  lines = [top_bottom_lines.reverse] + ['*' * num] + [top_bottom_lines]
  lines.flatten
  puts lines
end

diamond(1)
# *

diamond(3)
#  *
# ***
#  *

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
puts


# Alternate solution:
def diamond(num)
  lines = []
  num_lines = num / 2
  top_bottom_lines = []
  num_lines.times do |n|
    top_bottom_lines.unshift(('*' + ('*' * (n * 2))).center(num))
  end
  lines += top_bottom_lines.reverse
  lines += ['*' * num]
  lines += top_bottom_lines
  puts lines
end

diamond(1)
# *

diamond(3)
#  *
# ***
#  *

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
puts


# Alternate solution 2:
def diamond(num)
  lines = []
  num.times { |n| lines << (('*' * (n + 1)).center(num)) if n.even? }
  num.times { |n| lines << (('*' * (num - n)).center(num)) if n.even? }
  lines.delete_at(num / 2)
  puts lines
end

diamond(1)
# *

diamond(3)
#  *
# ***
#  *

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
puts


# Book solution:
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

diamond(1)
# *

diamond(3)
#  *
# ***
#  *

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *


# Try modifying your solution or our solution so it prints only the outline of
# the diamond:
def print_row(grid_size, distance_from_center)
  num_of_stars = grid_size - distance_from_center * 2
  line = ('*' * num_of_stars).center(grid_size)
  delete_stars = /\*(\*+)\*/
  if line.match(delete_stars)
    num_of_stars_to_delete = line.match(delete_stars)[1].size
    line.gsub!(delete_stars, "*#{' ' * num_of_stars_to_delete}*")
  end
  puts line
end


def diamond(grid_size)
  max_distance = grid_size / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance)}
  1.upto(max_distance) { |distance| print_row(grid_size, distance)}
end

diamond(5)
#   *
#  * *
# *   *
#  * *
#   *
diamond(9)
diamond(1)
diamond(3)
puts


# Alternate solution:
def print_row(grid_size, distance_from_center)
  num_of_stars = grid_size - distance_from_center * 2
  num_of_center_spaces = num_of_stars - 2
  num_of_center_spaces = 0 if num_of_center_spaces < 0
  line = ('*' + ' ' * num_of_center_spaces + "#{num_of_stars > 1 ? '*' : ''}")
         .center(grid_size)
  puts line
end


def diamond(grid_size)
  max_distance = grid_size / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance)}
  1.upto(max_distance) { |distance| print_row(grid_size, distance)}
end

diamond(5)
#   *
#  * *
# *   *
#  * *
#   *
diamond(9)
diamond(1)
diamond(3)
