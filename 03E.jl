# Acidity
function pH_to_category(pH)
    if 0 ≤ pH < 3
        return "Strongly acidic"
    elseif 3 ≤ pH < 6
        return "Weakly acidic"
    elseif 6 ≤ pH ≤ 8
        return "Neutral"
    elseif 8 < pH ≤ 11
        return "Weakly basic"
    elseif 11 < pH ≤ 14
        return "Strongly basic"
    end
end

using Test
@test pH_to_category(2.3) == "Strongly acidic"
