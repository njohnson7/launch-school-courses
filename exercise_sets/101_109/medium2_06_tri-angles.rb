# medium2_06_tri-angles.rb
# Tri-Angles

# A triangle is classified as follows:

#     right:   One angle of the triangle is a right angle (90 degress)
#     acute:   All 3 angles of the triangle are less than 90 degrees
#     obtuse:  One angle is greater than 90 degrees.

# To be a valid triangle, the sum of the angles must be exactly 180 degrees, and
# all angles must must be greater than 0: if either of these conditions is not
# satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and returns
# a symbol :right, :acute, :obtuse, or :invalid, depending on whether the
# triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about floating
# point errors. You may also assume that the arguments are specified in degrees.

def triangle(angle1, angle2, angle3)
  angles = angle1, angle2, angle3
  if angles.reduce(:+) != 180 || angles.include?(0) then :invalid
  elsif angles.include?(90) then :right
  elsif angles.any? { |ang| ang > 90 } then :obtuse
  else :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
p triangle(200, 50, 5) == :invalid
p triangle(90, 1, 89) == :right
p triangle(91, 1, 88) == :obtuse
p triangle(89, 2, 89) == :acute
