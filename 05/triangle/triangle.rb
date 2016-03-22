# Triangle Project Code.

# Triangle analyzes the lengths of the lengths of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all lengths are equal
#   :isosceles    if exactly 2 lengths are equal
#   :scalene      if no lengths are equal
#
def triangle(a, b, c)
  a, b, c = [a, b, c].sort
  raise TriangleError if a <= 0 or a + b <= c
  return :equilateral if a == c
  return :isosceles if a == b or b == c
  return :scalene
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
