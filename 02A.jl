## Notes #######
function evaluate_polynomial(x)
    a = 5
    b = -7
    c = 3
    return a*x^2 + b*x + c
end

function painting()
    name = "Mona Lisa"
    value = 100000000
    name, value
end

## Notes End ###

# 02A.jl Taylor series
function evaluateTaylor(x)
    y = (x-1) - (1/2)*(x-1)^2 + (1/3)*(x-1)^3
    y #function returns the last value
end

using Test
@test evaluateTaylor(2) ≈ 0.83333 atol=0.00001

# different input
evaluateTaylor(3)
# Run on vector by using the dot(.) operator for broadcasting
evaluateTaylor.([1, 2, 3, 4, 5])

