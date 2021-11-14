# Bacteria growth
function bacteria_growth(n₀, α, K, N)
    tₙ = 0
    nₜ = n₀
    while nₜ <= N
        nₜ = (1 + α*(1 - nₜ/K))*nₜ
        tₙ += 1
    end
    return tₙ
end


using Test
@test bacteria_growth(100, 0.4, 1000, 500) == 7
