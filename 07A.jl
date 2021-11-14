# Working with plots
using Plots

## Line graphs
x = [1; 3; 4; 5]
y = [2; 3; 3; 4]
plot(x, y)
title!("Simple line graph")
xlabel!("x-values")
ylabel!("y-values")
xlims!(0, 6)
ylims!(0, 5)
savefig("./plots/line-graph.svg")

## Scatter plot
x = [1; 3; 4; 5]
y = [2; 3; 3; 4]
scatter(x, y, markershape = :star, color=:blue)
title!("Simple line graph")
xlabel!("x-values")
ylabel!("y-values")
xlims!(0, 6)
ylims!(0, 5)
savefig("./plots/line-graph-scatter.svg")

# 07A.jl
## Cassiopeia graph
x = [-3; -1; 0; 3; 3]
y = [0; -2; 0; -1; 2]
scatter(x, y, markershape = :star, color=:blue)
plot!(x, y, color=:red)
title!("Sketch of the Cassiopeia star constellation")
xlabel!("relative x value from center star")
ylabel!("relative y value from center star")
xlims!(-4, 4)
ylims!(-3, 3)
savefig("./plots/cassiopeia.svg")
