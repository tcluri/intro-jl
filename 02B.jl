# Working with vectors #######
a = [1,2,3]
a[1] = 7
a

a = [3.4, 5.2, 7.4, 9.2, 5.3]
a[2:4]

index = [1, 3, 5]
a[index]

a = [3.4, 5.2, 7.4, 9.2, 5.3]
index = [1, 3, 5]
a[index] .= 0 # use broadcasting to assign value at respective indices

a = zeros(1, 4) # Matrix
b = ones(1, 4)  # Matrix

a = zeros(4) # Vector
b = ones(4)  # Vector

a = 5:9 # UnitRange
collect(a) # Vector

a = 1:3 # UnitRange
b = 6:7 # UnitRange
c = [a; b] # Vector

# Random
rand(1, 4) # Matrix

a = [1, 2, 3, 4, 5] # vector one
a*2
2 .+ a
a/3

b = [5, 4, 3, 2, 1] # vector two
a + b
a - b
a .* b
a ./ b

# Vector operations
a = [1, 2, 3, 4, 5]
minimum(a)
maximum(a)
sum(a)
# Statistics
using Statistics
mean(a)
length(a)
# Linear Algebra
using LinearAlgebra
a = [1, 2, 3]
b = [3, 2, 1]
dot(a,b)

# Comparision operators and logical indexing
a = [1.1, 2.2, 3.3, 4.4]
b = [3.1, 2.2, 1.3, 0.4]
a .> b # broadcasting for vector comparision
a[a .> b]

a = [1.1, 2.2, 3.3, 4.4]
b = [3.1, 2.2, 1.3, 0.4]
(a .> b) .| (a .< 2)

a = zeros(4) # all false
b = ones(4)  # all true

# Error messages
a = [2, 3, 4]
b = [1, 2, 3, 4]
a[4]
a .* b
# Working with vectors End####

## 02B.jl
v₁ = [3, 7, 1]
v₂ = zeros(6)
v₃ = ones(3)
v₄ = collect(1:4)
v₅ = vcat(collect(1:5), collect(10:14)) # or v₅ = append!(collect(1:5), collect(10:14))

v₁[1]
v₄[2]
v₃[4]
append!(v₄, 10)
v₅ = [3, 7, 1]
