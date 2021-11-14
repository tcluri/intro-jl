# Matrices
A = [1 2 3; 4 5 6]

# Converting between vectors and matrices
a = [1, 4, 2, 5, 3, 6]
A = reshape(a, (2, 3))
b = A[:]

# Accessing elements
A[2, 3]
A[1,:]
A[:, 2:3]

# Concatenating matrices
B = [7 8; 9 10]
C = [11 12 13; 14 15 16; 17 18 19]

AB = [A B]
AC = [A; C]

# Matrix operations
minimum(A, dims=1)
minimum(A, dims=2)
sum(A, dims=1)
sum(A, dims=2)
size(A)

## Matrix multiplication
A = [1 2 3; 4 5 6]
b = [3; 2; 1]
A*b

## Matrix transposition
A' # transpose

# 06B.jl
using LinearAlgebra
function compute_item_cost(resource_item_matrix, resource_cost)
    output_vec = Float64[]
    cols = 1:size(resource_item_matrix)[1]
    for col in cols
        push!(output_vec, dot(resource_item_matrix[:, col], resource_cost))
    end
    return output_vec
end

# Run compute_item_cost
A = [6 3 0; 17 11 9; 4 2 12]
cost_vector = [101.25 84.00 75.50]
k = compute_item_cost(A, cost_vector)

using Test
@test compute_item_cost([6 3 0; 17 11 9; 4 2 12], [101.25 84.00 75.50]) ==  [2337.5, 1378.75, 1662.0]
