### Bacteria data analysis

using CSV, DataFrames
# Data Load function
function dataLoad(fileName)
    data = CSV.read(fileName, DataFrame, delim=' ', header = ["Temperature", "Growth rate", "Bacteria"])
    # Checks for proper data
    temp_check = (data.Temperature .> 60) .| (data.Temperature .< 10) .| (ismissing.(data.Temperature))
    temp_indices = findall(temp_check)
    growth_rate_check = (data[!, "Growth rate"] .<= 0) .| (ismissing.(data[!, "Growth rate"]))
    growth_rate_indices = findall(growth_rate_check)
    bacteria_check = (data.Bacteria .∉ Ref([1, 2, 3, 4])) .| (ismissing.(data.Bacteria))
    bacteria_indices = findall(bacteria_check)
    # Bacteria mapping
    bacteria_map = Dict(1 => "Salmonella enterica", 2 => "Bacillus cereus", 3 => "Listeria", 4 => "Brochothrix thermosphacta")
    for temp_err in temp_indices
        println("Error on line: ", temp_err,". Temperature must be a number between 10 and 60.")
    end
    for growth_err in growth_rate_indices
        println("Error on line: ", growth_err,". Growth rate must be a positive number.")
    end
    for bacteria_err in bacteria_indices
        println("Error on line: ", bacteria_err, ". Bacteria must be in ", values(bacteria_map))
    end
    # Removing all the rows with errors
    err_rows = sort(unique(vcat(temp_indices, growth_rate_indices, bacteria_indices)))
    # Remove rows with missing values
    # println("Removing rows ", err_rows, " containing errors.")
    delete!(data, err_rows)
    data.Bacteria = map(x -> bacteria_map[x], data.Bacteria)
    return data
end

using Statistics
# Data statistic function
function dataStatistics(data, statistic)
    result = NaN
    if statistic == "Mean Temperature"
        result = mean(data.Temperature)
    elseif statistic == "Mean Growth rate"
        result = mean(data[!, "Growth rate"])
    elseif statistic == "Std Temperature"
        result = std(data.Temperature)
    elseif statistic == "Std Growth rate"
        result = std(data[!, "Growth rate"])
    elseif statistic == "Rows"
        result = size(data)[1]
    elseif statistic == "Mean Cold Growth rate"
        result = mean(data[data[!, "Temperature"] .< 20, "Growth rate"])
    elseif statistic == "Mean Hot Growth rate"
        result = mean(data[data[!, "Temperature"] .> 50, "Growth rate"])
    end
    return result
end


using Plots
# Data plot function
function dataPlot(data)
    println("Plotting first figure")
    bacteria_type = unique(data.Bacteria)
    bacteria_count = Dict([(each_bacteria, count(num_bacteria -> num_bacteria == each_bacteria, data.Bacteria)) for each_bacteria in bacteria_type])
    bar(collect(keys(bacteria_count)), collect(values(bacteria_count)), legend=false)
    title!("Number Of Bacteria")
    xlabel!("Bacteria Type")
    ylabel!("Number")
    ylims!(0, 30)
    yticks!(0:2:30)
    savefig("./plots/bacteria_barplot.svg")

    # Second figure
    println("Plotting second figure")
    # Line colours
    colours = [:blue, :indianred, :darkmagenta, :green]
    # Plot for each bacteria type
    plot()
    for (plot_num, each_bacteria) in enumerate(bacteria_type)
        bacteria_df = sort(data[data[!, "Bacteria"] .== each_bacteria, names(data)], "Temperature")
        temperature_values = bacteria_df[!, "Temperature"]
        growth_values = bacteria_df[!, "Growth rate"]
        plot!(temperature_values, growth_values, color=colours[plot_num], label=each_bacteria, legend=:outertopright)
    end
    xlims!(10, 60)
    ylims!(0,Inf)
    xlabel!("Temperature")
    ylabel!("Growth rate")
    title!("Bacteria growth rate with temperature")
    savefig("./plots/bacteria-growth-rate-with-temperature.svg")
end


# # Run the file
fileName = "./data/Bacteria/test.txt"
data_df = dataLoad(fileName)
dataPlot(data_df)
