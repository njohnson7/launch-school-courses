# medium2_05_triangle_sides.rb
# Triangle Sides

# A triangle is classified as follows:

#     equilateral:  All 3 sides are of equal length
#     isosceles:    2 sides are of equal length, while the 3rd is different
#     scalene:      All 3 sides are of different length

# To be a valid triangle, the sum of the lengths of the two shortest sides must
# be greater than the length of the longest side, and all sides must have
# lengths greater than 0: if either of these conditions is not satisfied, the
# triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as
# arguments, and returns a symbol :equilateral, :isosceles, :scalene, or
# :invalid depending on whether the triangle is equilateral, isosceles, scalene,
# or invalid.

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  if sides.first + sides[1] <= sides.last || sides.any? { |s| s <= 0 }
    :invalid
  elsif sides.uniq.size == 1
    :equilateral
  elsif sides.uniq.size == 2
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
p triangle(0, 0, 1) == :invalid
p triangle(9, 9, 9) == :equilateral
p triangle(4, 5, 7) == :scalene
p triangle(4, 4, 7) == :isosceles
p triangle(3, 1, 1) == :invalid
p triangle(1, 3, 1.5) == :invalid
p triangle(3.5, 3.5, 3.5) == :equilateral
p triangle(3.5, 3.5, 6.5) == :isosceles
p triangle(3.5, 2.5, 4.5) == :scalene
