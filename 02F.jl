# LinearAlgebra
using LinearAlgebra
# Calculate Projection vector given a vector a
function compute_projection(a)
    # Assuming a has all elements of the same type
    # Check length of the vector a
    if a != []
        type_a = typeof(a[1])
    end
    ## b = ones(Int64, length(a)) # Int64 solution
    b = ones(type_a, length(a))
    projection = (dot(a, b) / sum(a.^2)) .* a
end


using Test
@test compute_projection([2, -1]) == [0.4000, -0.2000]
