# Basics
## Enter shell mode by pressing ; in the julia-repl
;ls
;pwd
;cd

# Loading and saving variables in files
x = 1:10
y = sin.(x)

using JLD
# Save
save("./output/saved.jld", "x", x, "y", y)

# Load
d = load("./output/saved.jld")
d["x"]
d["y"]


# 06A.jl
cd("./data/")
run(`ls`)
cd("../")## go back to the folder
using MAT
# load matlab file
smooth_dict = matread("./data/smooth.mat")
x = smooth_dict["x"]
y = smooth_dict["y"]

# Converting x, y values into a vector
x, y = vec(x), vec(y)
# Plot the variables x,y
using Plots
plot(x, y)

# Change y
y .= 1 .- y
# Saving values to a JLD file
save("./output/06A.jld", "x", x, "y", y)
# Saving values to another MAT file
matwrite("./output/06A.mat", Dict("x" => x, "y" => y))
