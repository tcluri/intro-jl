v = [4, 7, -2, 9, 3, -6, -4, 1]

# Set all negative values to zero
v[v .< 0] .= 0
# Change the sign of all values
v *= -1
# Set all values that are less than the average to zeros
using Statistics
v[v .< mean(v)] .= 0
# Set all negative values to positive
v[v .< 0] .*= -1
# Multiply all positive values by two
v[v.> 0] .*= 2
# Raise all values to the power of 2, but keep their original sign
v .* abs.(v)


### Start Testing #####
# Unit testing
using Test

# Function to calculate final velocity
v_f(vᵢ, a, d) = √(vᵢ^2 + 2*a*d)

@test v_f(0, 0, 0) == 0
@test v_f(10, 0, 0) == 10
@test v_f(5, 0, 5) == 5
@test v_f(10, 7, 0) == 10
@test v_f(0, 1, 5) > 0
@test v_f(5, 2, 5) > 5

### End Testing #######
