# Box Area
function box_area(box_corners, area)
    box1 = (box_corners[2] - box_corners[1]) * (box_corners[6] - box_corners[5])
    box2 = (box_corners[4] - box_corners[3]) * (box_corners[8] - box_corners[7])
    intersection_a = max(0, (min(box_corners[2], box_corners[4]) - max(box_corners[1], box_corners[3])))
    intersection_b = max(0, (min(box_corners[6], box_corners[8]) - max(box_corners[5], box_corners[7])))
    intersection = intersection_a * intersection_b
    if area == "Box1"
        return box1
    end
    if area == "Box2"
        return box2
    end
    if area == "Intersection"
        return intersection
    end
    if area == "Union"
        return box1 + box2 - intersection
    end
end

# On using MATLAB-like switch case statements
# https://github.com/JuliaLang/julia/issues/18285
