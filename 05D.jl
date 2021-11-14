rand(1, 4)

# Set seed value
using Random
Random.seed!(0) # re-run for every rand call to get the same values
rand(1, 4)

using Distributions
rand(Uniform(8, 9), 1, 4) # Uniform distribution between 8 and 9


## 05D.jl

function random_sequence(μ, R, N)
    low_var = μ - (R/2)
    high_var = μ + (R/2)
    rand(Uniform(low_var, high_var), N)
end

random_sequence(5, 3, 6)
mean(random_sequence(5, 3, 6)) # Empirical mean

# Empirical mean vs. theoretical mean
mean(random_sequence(10, 100, 1000))
# Empirical mean for multiple runs with the same N value

# Empirically estimate the range
