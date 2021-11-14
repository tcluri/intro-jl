# Piecewise function
g₀ = 9.82 # [m/s^2]
R = 6.371*(10^6) # [m]

function gravitational_pull(x)
    if R ≤ x
        return g₀*(R/x)^2
    elseif 0 ≤ x ≤ R
        return g₀*(x/R)
    end
end

using Test
@test gravitational_pull(1.78e6) ≈ 2.7436 atol=0.0001

## Using a vector as input to gravitational_pull
distance_vector = 1:1e4:10e6
using Plots
plot(distance_vector, gravitational_pull.(distance_vector))
savefig("./plots/gravity-piecewise-function.svg")
