# Input from the user
a_string = readline()

# Convert a string to float
b_string = parse(Float64, readline())

# Interactive temperature calculator
include("./05A.jl")

# Interactive part to get values of temperature(T) and unitFrom and unitTo
function T_inp()
    print("Please input a temperature: ")
    readline()
end
function unitTo()
    print("Please input the unit of temperature to convert to: ")
    readline()
end

function unitFrom()
    print("Please input the unit of temperature (Celsius, Fahrenheit, Kelvin): ")
    readline()
end

function interactive_temp()
    # Conversion start
    unit_to = ""
    unit_from = ""
    T = 0
    # Units
    units = ["Fahrenheit", "Celsius", "Kelvin", "F", "C", "K"]
    # Try again loops
    while true
        try
            T = parse(Float64, T_inp())
            break
        catch
            println("Try entering a number")
        end
    end
    while true
        unit_from = titlecase(unitFrom())
        if unit_from in units
            break
        end
    end
    while true
        unit_to = titlecase(unitTo())
        if unit_to in units
            break
        end
    end
    result = convert_temperature(T, unit_from, unit_to)
    println("$T $unit_from = $result $unit_to")
end

interactive_temp()
