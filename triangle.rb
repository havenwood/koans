# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  a, b, c = sides = [a, b, c].sort
  raise TriangleError, "The smallest side of a triangle is always greater than zero." unless a > 0
  raise TriangleError, "No side of a triangle is bigger than the other two combined." unless a + b > c
  case sides.uniq.count
  when 3
    :scalene
  when 2
    :isosceles
  else
    :equilateral
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
