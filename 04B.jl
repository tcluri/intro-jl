# Power series approximation
function power_series_app_for(N)
    out = 0.0
    for i ∈ 0:N
        out += ((-1)^i)/(2*i + 1)
    end
    out *= 4
    return out
end

# Power series approximation vectorized
function power_series_app_vect(x)
    out = 4 * ((-1)^x / (2*x+1))
    return out
end

## N=100
pow_for = power_series_app_for(100)            # 3.15149
pow_vect = sum(power_series_app_vect.(0:100))  # 3.15149

## Vectorized power series approximation is easier to understand
## Timing the two functions
using BenchmarkTools
@btime power_series_app_for(1_000_000)          # faster and more precise, 0 allocations: 0 bytes
@btime sum(power_series_app_vect.(0:1_000_000)) # slower and less precise, 2 allocations: 7.63 MiB

