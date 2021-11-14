v₁ = collect(1:5)
v₂ = collect(3:7)
v₃ = ones(4)

# Dot product of v₁ and v₂
using LinearAlgebra
dot(v₁, v₂)

# Elementwise multiplication of v₁ and v₂
v₁ .* v₂

# Sine function applied to each element of v₁
sin.(v₁)

# Length of v₁
length(v₁)

# Dot product of v₁ and v₃
dot(v₁, v₃) # ERROR: DimensionMismatch
