# 07C.jl
# Histograms
function coin_toss(N)
    # heads is false, tails is true
    x = rand(N)
    return x
end

x1 = coin_toss(10)
x2 = coin_toss(100)
x3 = coin_toss(1000)

using Plots
histogram(x1, bins=2)
histogram(x2, bins=2)
histogram(x3, bins=2)

# Loaded coin where P_h = 0.7, P_t = 0.3
function loaded_coin(N)
    x = rand(N) .≤ 0.7
    return x
end

x4 = loaded_coin(10)
x5 = loaded_coin(100)
x6 = loaded_coin(10000)

histogram(x4, bins=2, bar_edges=true)
histogram(x5, bins=2, bar_edges=true)
histogram(x6, bins=2, bar_edges=true)


# Six sided fair-dice
function fair_dice(N)
    x = rand(1:6, N)
    return x
end

x7 = fair_dice(10)
x8 = fair_dice(100)
x9 = fair_dice(1000)

function fair_dice_plot(N)
    counts = [count(fair_dice(N) .== i) for i in 1:6]
    # Bar plot
    bar(counts, alpha=0.5, leg=false, size=(500, 300))
    hline!([N / 6], ls=:dash)
end

fair_dice_plot(10)
fair_dice_plot(100)
fair_dice_plot(1000)

fair_dice_plot(100000)
