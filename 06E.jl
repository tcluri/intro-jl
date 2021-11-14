# Working with CSV files
using CSV, DataFrames
df = DataFrame(CSV.File("./data/topscorers_small.csv"))
# df = CSV.File("./data/topscorers_small.csv") |> DataFrame

## column names
names(df)
df[!, "Goals"]
df[!, :Goals]
df[!, :MinutesPlayed]./df[!, :Goals]
df[!, :Player]
df[!, :Goals][3]
df[!, :Player][3]
df[:, 4]
df[2, :]

# 06E.jl
# Language detection
include("./06D.jl")
# using CSV, DataFrames
function compute_language_error(freq)
    output_vec = []
    letter_frequencies = CSV.File("./data/letter_frequencies.csv") |> DataFrame
    for each_col in names(letter_frequencies)[2:end]
        Eₗ = sum((freq .- letter_frequencies[!, each_col]).^2)
        push!(output_vec, Eₗ)
    end
    output_vec
end


using Test
freq = [8.101852, 2.237654, 2.469136, 4.552469, 12.345679, 2.006173, 1.929012, 6.712963, 7.175926, 0.077160, 1.157407, 3.395062, 1.080247, 6.712963, 7.870370, 1.466049, 0.077160, 6.018519, 5.401235, 10.956790, 2.854938, 0.925926, 2.932099, 0.000000, 1.543210, 0.000000]

expected_output = [9.0393, 108.2363, 99.5453, 121.0195, 165.5445, 164.7483, 128.5608, 211.0725, 89.9806, 190.6440, 93.7989, 112.9329, 192.2470, 173.1080, 134.5387]


@test compute_language_error(freq) ≈ expected_output atol=0.001

