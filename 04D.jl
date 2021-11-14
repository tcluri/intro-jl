# Fermentation rate
function fermentation_rate(measured_rate, lower, upper)
    measured_rate = measured_rate[lower .< measured_rate .< upper]
    return sum(measured_rate)/length(measured_rate)
end

using Test
@test fermentation_rate([20.1, 19.3, 1.1, 18.2, 19.7, 121.1, 20.3, 20.0], 15, 25) ≈ 19.6
