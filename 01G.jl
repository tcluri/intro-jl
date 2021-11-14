# cosine rule to compute the length of a side(a) in a triangle
# when you know the other two sides(b, and c) and the
# opposing angle (A)

a(b, c, A) = √(b^2 + c^2 - 2b*c*cos(A))

b = 12
c = 10
A = 0.25π  #radians

side_a = a(b, c, A)

using Test
@test side_a ≈ 8.6194 atol=0.0001
