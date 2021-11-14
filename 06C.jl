# 06C.jl
# n-sample symmetric weighted moving average; 5-sample
function moving_average(input_signal, weights=[1, 2, 3, 2, 1])
    output_matrix = []
    weight_len = length(weights)
    weights_sum = sum(weights)
    for i in 1:length(input_signal)
        y_m2, y_m1, y_i, y_p1, y_p2 = 0, 0, 0, 0, 0
        # Statements for calculating elements
        try
	          y_m2 = input_signal[i-2]
        catch BoundsError
            y_m2 = 0
        end
        try
	          y_m1 = input_signal[i-1]
        catch BoundsError
            y_m1 = 0
        end
        try
	          y_i = input_signal[i]
        catch BoundsError
            y_i = 0
        end
        try
	          y_p1 = input_signal[i+1]
        catch BoundsError
            y_p1 = 0
        end
        try
	          y_p2 = input_signal[i+2]
        catch BoundsError
            y_p2 = 0
        end
        # Collect each row to a matrix
        row = [y_m2; y_m1; y_i; y_p1; y_p2]
        if i == 1
            output_matrix = row
        else
            output_matrix = hcat(output_matrix, row)
        end
    end
    # Get weights and calculate average
    for w in 1:weight_len
        output_matrix[w, :] *= weights[w]
    end
    output_matrix = sum(output_matrix, dims=1)
    output_matrix = vec(output_matrix / weights_sum)
    return output_matrix
end


using Test
@test moving_average([0.8 0.9 0.7 0.6 0.3 0.4]) ≈ [0.54444; 0.7; 0.68889; 0.56667; 0.4; 0.26667] atol=0.00001

# Load matlab file
using MAT
smooth_dict = matread("./data/smooth.mat")
x = vec(smooth_dict["x"])
y = vec(smooth_dict["y"])
# Plotting
using Plots
plot(x, sin.(x), linecolor=:black)
scatter!(x, y, markercolor=:blue)
scatter!(x, moving_average(y), markercolor=:red)
plot!(x, moving_average(y), linecolor=:red)
savefig("./plots/moving-average.svg")
