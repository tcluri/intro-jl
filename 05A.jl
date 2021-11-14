# Temperature conversion
function convert_temperature(T, unitFrom, unitTo)
    # From a particular unit to another particular unit
    # among: {Celcius, Farenheit, Kelvin}
    if unitFrom == "Celsius" || unitFrom == "C"
        if unitTo == "Fahrenheit" || unitTo == "F"
            temp = 1.8 * T + 32
        elseif unitTo == "Kelvin" || unitTo == "K"
            temp = T + 273.15
        end
    elseif unitFrom == "Fahrenheit" || unitFrom == "F"
        if unitTo == "Celsius" || unitTo == "C"
            temp = (T-32)/1.8
        elseif unitTo == "Kelvin" || unitTo == "K"
            temp = (T + 459.67)/1.8
        end
    elseif unitFrom == "Kelvin" || unitFrom == "K"
        if unitTo == "Celsius" || unitTo == "C"
            temp = T - 273.15
        elseif unitTo == "Fahrenheit"
            temp = 1.8*T - 469.67
        end
    end
    return temp
end


using Test
@test convert_temperature(50, "Fahrenheit", "Celsius") == 10
