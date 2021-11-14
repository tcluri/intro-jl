# Monte Carlo estimation
function circle_area_mc(xvals, yvals)
    if length(xvals) == length(yvals)
        A_square = 4
        n = sum(.√(xvals.^2 + yvals.^2) .< 1)
        N = length(xvals)
        A_circle = A_square * (n/N)
    else
        A_circle = 0
    end
    return A_circle
end

# Generating random values for xvals and yvals
include("./05D.jl")
xvals = random_sequence(0, 2, 5)
yvals = random_sequence(0, 2, 5)

circle_area_mc(xvals, yvals)


using Test
@test circle_area_mc([-0.1, 0.7, 0.8, 0.5, -0.4], [0.3, -0.1, 0.9, 0.6, -0.3]) == 3.2

# Calling function for different number of points
xvals_10 = random_sequence(0, 2, 10)
yvals_10 = random_sequence(0, 2, 10)

xvals_1000 = random_sequence(0, 2, 1000)
yvals_1000 = random_sequence(0, 2, 1000)

xvals_1000000 = random_sequence(0, 2, 1000000)
yvals_1000000 = random_sequence(0, 2, 1000000)

circle_area_mc(xvals_10, yvals_10)
circle_area_mc(xvals_1000, yvals_1000)
circle_area_mc(xvals_1000000, yvals_1000000)

# Calling function for same number of points multiple times
circle_area_mc(random_sequence(0, 2, 1000000), random_sequence(0, 2, 1000000))

# Plot an image of a circle along with your points
using Plots
p = 0:0.01:2π
plot(sin.(p), cos.(p))
scatter!(xvals_1000, yvals_1000)
savefig("./plots/circle-points.svg")
