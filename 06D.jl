# Reading text files
f = open("./data/small_text.txt")
smalltxt_lines = readlines(f)

# 06D.jl
# Frequency of letters
function letter_frequency(file_name)
    alphabets = 'a':'z'
    file = open(file_name)
    alpha_dict = Dict()
    for each_line in readlines(file)
        for each_char in lowercase(each_line)
            if each_char in alphabets
                if each_char in keys(alpha_dict)
                    alpha_dict[each_char] += 1
                else
                    alpha_dict[each_char] = 1
                end
            end
        end
    end
    all_char_sum = sum(values(alpha_dict))
    freq = []
    for each_key in alphabets
        append!(freq, (get(alpha_dict, each_key, 0)/all_char_sum))
    end
    return freq .* 100
end


using Test
@test letter_frequency("./data/small_text.txt") ≈ [8.1019, 2.2377, 2.4691, 4.5525, 12.3457, 2.0062, 1.9290, 6.7130, 7.1759, 0.0772, 1.1574, 3.3951, 1.0802, 6.7130, 7.8704, 1.4660, 0.0772, 6.0185, 5.4012, 10.9568, 2.8549, 0.9259, 2.9321, 0, 1.5432, 0] atol=0.001
