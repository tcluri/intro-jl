# Strings

# Concatenating strings
str1 = "This"
str2 = "is"
str3 = "easy"

str1 * str2 * str3
str1 * " " *  str2 *  " " * str3

str = str1 * "-" * str2 * "-" * str3

# Extracting substrings
str[6]
str[6:10]
# Find and replace in strings
findfirst("is", str)
replace(str, "is" => "eta")
# Splitting strings into tokens
split(str, "-")
# Vector of strings
my_strings = ["This is one string", "Here is another", "This is the third"]
my_strings[3]

# 07G.jl
function text_to_nato(plaintext)
    plaintext = lowercase(plaintext)
    nato_map = Dict('a'=>"Alpha",
                    'b'=>"Bravo",
                    'c'=>"Charlie",
                    'd'=>"Delta",
                    'e'=>"Echo",
                    'f'=>"Foxtrot",
                    'g'=>"Golf",
                    'h'=>"Hotel",
                    'i'=>"India",
                    'j'=>"Juliet",
                    'k'=>"Kilo",
                    'l'=>"Lima",
                    'm'=>"Mike",
                    'n'=>"November",
                    'o'=>"Oscar",
                    'p'=>"Papa",
                    'q'=>"Qubec",
                    'r'=>"Romeo",
                    's'=>"Sierra",
                    't'=>"Tango",
                    'u'=>"Uniform",
                    'v'=>"Victor",
                    'w'=>"Whiskey",
                    'x'=>"Xray",
                    'y'=>"Yankee",
                    'z'=>"Zulu",
                    )
    output_string = ""
    for each_ind in eachindex(plaintext)
        each_char = plaintext[each_ind]
        if each_char ∉ keys(nato_map)
            output_string *= each_char
        else
            if each_ind == length(plaintext)
                output_string *= nato_map[each_char]
                return output_string
            else
                output_string *= nato_map[each_char] * "-"
            end
        end
    end
    return output_string
end


using Test
@test text_to_nato("hello") == "Hotel-Echo-Lima-Lima-Oscar"

