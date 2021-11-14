v₁ = [4, 2, 1, 2, 5]
v₂ = [-1, 4, 5, -3, 6]

v₃ = v₁[v₁ .< 3]   # [2, 1, 2]
v₃ = v₂[v₂ .< 0]   # [-1, -3]
v₃ = v₂[v₂ .> 0]   # [4, 5, 6]
v₃ = v₁[v₁ .> 100] # Int64[]
v₃ = v₁[v₁ .> v₂]  # [4, 2]
v₃ = v₂[v₂ .!= 5]  # [-1, 4, -3, 6]
using Statistics
v₃ = v₁[v₁ .> mean(v₁)]
