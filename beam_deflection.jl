# Beam deflection

# Deflection function for both
function deflection_both(x, l, a, W, E, I)
	  if x < a
        y = (W*(l-a)*x/6E*I*l) * (l^2-x^2-(l-a)^2)
    elseif x ≥ a
        y = (W*a*(l-x)/6E*I*l) * (l^2 - (l-x)^2 - a^2)
    end
    return y
end

# Deflection function for cantilever
function deflection_cantilever(x, l, a, W, E, I)
    if x < a
        y = (W*x^2 / 6E*I)*(3a-x)
    elseif x ≥ a
        y = (W*a^2 / 6E*I)*(3x-a)
    end
    return y
end

# Beam deflection function
function beamDeflection(positions, beam_length, load_position, load_force, beam_support)
    # Constants
    E, I = 200*(10^9), 0.001
    # Variables units
    # position in meters
    # beam_length in meters
    # load_position in meters
    # load_force in Newtons
    # beam_support ["both", "cantilever"]
    pos_len = length(positions)     # Postions vector length
    # Initialize the deflection vector
    deflections = Vector{Float64}(undef, pos_len)
    # Deflection function
    if beam_support == "cantilever"
        deflection_func = deflection_cantilever
    elseif beam_support == "both"
        deflection_func = deflection_both
    else
        println("Beam support should be either cantilever or both")
    end
    for (ind, position) in enumerate(positions)
        deflections[ind] = deflection_func(position, beam_length, load_position, load_force, E, I)
    end
    return deflections
end


# Beam deflection function
function beamSuperposition(positions, beam_length, load_positions, load_forces, beam_support)
    # Postion length
    pos_len = length(positions)
    # Forces length
    load_forces_len = length(load_forces)
    # Deflections are zero if load_forces or positions length is zero
    deflections = zeros(pos_len)
    if pos_len == 0 | load_forces_len == 0
        return deflections
    end
    for (load_force, load_position) in zip(load_forces, load_positions)
        # Superposition principle
        deflections .+= beamDeflection(positions, beam_length, load_position, load_force, beam_support)
    end
    return deflections
end
