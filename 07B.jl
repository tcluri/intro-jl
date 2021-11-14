# 07B.jl
# Scatter plot
using Plots

# x, y each containing 2000 random numbers between -10, 10
using Distributions
x = rand(Uniform(-10, 10), 2000)
y = rand(Uniform(-10, 10), 2000)
zip_list = [(i, j) for (i, j) in zip(x, y) if (max(abs(i), abs(j)) > 5) && (√(i^2 + j^2) < 10)]

x_cond = [zip_item[1] for zip_item in zip_list]
y_cond = [zip_item[2] for zip_item in zip_list]

scatter(x_cond, y_cond)
savefig("./plots/scatter-oval.svg")
