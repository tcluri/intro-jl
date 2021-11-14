# Removing incomplete experiments
function remove_incomplete(id_vector)
    parts = [1, 2, 3]
    output = []
    for each_num in id_vector
        each_n = round(each_num)  # Float
        keep = true
        for each_part in parts
            if (each_n + each_part/10) ∉ id_vector
                keep = false
                break
            end
        end
        if keep
            append!(output, each_num)
        end
    end
    return output
end


using Test
@test remove_incomplete([1.3, 2.2, 2.3, 4.2, 5.1, 3.2, 5.3, 3.3, 2.1, 1.1, 5.2, 3.1]) == [2.2, 2.3, 5.1000, 3.200, 5.300, 3.300, 2.100, 5.2, 3.1]
