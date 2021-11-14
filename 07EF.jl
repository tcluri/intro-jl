# 07E.jl
# Temperature in the UK
using CSV, DataFrames

temperature_df = DataFrame(CSV.File("./data/UKTemperature.csv"))

# Information given about columns
# Col1 : Year, Col2-Col13: Month, Col14: Average/Yearly mean
# Names of the columns

# Year column
year_vals_xaxis = temperature_df[!, "Year"]
# Mean of the temperatures for a particular year
mean_vals_yaxis = temperature_df[!, "Average"]

# Plot the figure
using Plots
plot(year_vals_xaxis, mean_vals_yaxis, legend=false)
xlims!(1920, 2010)
xticks!(1920:10:2010)
ylims!(7,10)
yticks!(7:0.5:10)
xlabel!("Year")
ylabel!("Mean temperature (degree Celcius)")
title!("Mean temperature in the UK")
savefig("./plots/UKtemperature1.svg")

# Calculating the monthly mean temperature
mean_temps = []
months = names(temperature_df)[2:13]
for each_year in 1:length(year_vals_xaxis)
    push!(mean_temps, sum(temperature_df[each_year, months])/12)
end


# Plot the figure
plot(year_vals_xaxis, [mean_vals_yaxis, mean_temps], label=["Annual mean" "Monthly mean"], color=[:blue :red], legend=:topleft)
xlims!(1920, 2010)
xticks!(1920:10:2010)
ylims!(7,10)
yticks!(7:0.5:10)
xlabel!("Year")
ylabel!("Mean temperature (degree Celcius)")
title!("Yearly temperature development in the UK")

# 07F.jl
savefig("./plots/UKtemperature2.svg")

