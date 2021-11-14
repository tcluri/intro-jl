# Angle between lines
using LinearAlgebra
function acute_angle(v1, v2)
    angle_rad = acos(dot(v1, v2))
    if angle_rad > (π/2)
        angle_rad = π - angle_rad
    end
    return angle_rad
end

using Test
@test acute_angle([-4/5, 3/5], [20/29, 21/29]) ≈ 1.4533 atol=0.001
