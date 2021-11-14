# 07D.jl
# Radiocarbon dating

t_halflife = 5700 # years
λ = log(2) / t_halflife
N₀ = 100

function est_time(N)
    t = -(1/λ) * log(N/N₀)
    return t
end

# Percentage of carbon remaining
N_vals = 0:0.1:100
# Looping over N_vals
t_vals = est_time.(N_vals)


# Plot the N_vals(percent of carbon) vs t_vals(time in years)
using Plots
plot(N_vals, est_time.(N_vals), legend=false)
xlims!(0, 100)
ylims!(0, 6e4)
xlabel!("Percentage of Carbon-14 remaining")
ylabel!("Age of material")
title!("Carbon-14 decay")
savefig("./plots/radiocarbon-dating.svg")

# Tusk of wolly mammoth is discovered
# Ratio between C-12 and C-14 is found to be only 1/10 the
# ratio measured from ivory of recently deceased elephants.
# Verify from the plot above that the mammoth is around 19,000 years old.
# This above statement is true

# C-14 measurements are considered unreliable for estimating organic
# material older than 50,000 years
# This above statement is true since in the above plot the 50,000
# mark can only indicate that clearly and beyond that would all be the same
# and thus is not accurate.
