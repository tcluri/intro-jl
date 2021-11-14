# Football goal tracker
function compute_passes_goal_line(point, direction_vector)
    goal_xs = [0, 105]
    x, y = point
    vx, vy = direction_vector
    if vx > 0
        goal_x = goal_xs[2]
    elseif vx < 0
        goal_x = goal_xs[1]
    else
        return false
    end
    # Calculate alpha from x and then calculate y
    alpha = (goal_x - x)/vx
    # Calculate alpha from x and then calculate y
    goal_y = y + alpha*vy
    # # Calculate alpha from x and then calculate y
    # goal_y = y + alpha*vy
    if 30.34 < goal_y < 37.66
        return true
    else
        return false
    end
end


using Test
@test compute_passes_goal_line([30, 20], [10, 2]) == true
