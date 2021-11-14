# Thermodynamic simulation - Monte Carlo method behaviour of gas
function thermo_equilibrium(N, r)
    t = 0
    Nₗ = N  # initial number of particles in the left chamber
    Nᵣ = 0   # initial number of particles in the right chamber
    if iseven(N)   # only even number of particles can acheive equilibrium
        for each_r in r
            if Nₗ == Nᵣ
                break
            end
            p_lr = Nₗ/N
            if each_r ≤ p_lr # Monte Carlo behaviour
                Nᵣ += 1
                Nₗ -= 1
            else
                Nᵣ -= 1
                Nₗ += 1
            end
            t += 1
        end
    end
    if Nₗ != Nᵣ
        t = 0
    end
    return t
end

using Test
@test thermo_equilibrium(2,  [0.16, 0.04, 0.72, 0.09, 0.17, 0.60, 0.26, 0.65, 0.69, 0.74, 0.45, 0.61, 0.23, 0.37, 0.15, 0.83, 0.61, 1.00, 0.08, 0.44]) == 1

# Testing for different numbers of N
thermo_equilibrium(10,  [0.16, 0.04, 0.72, 0.09, 0.17, 0.60, 0.26, 0.65, 0.69, 0.74, 0.45, 0.61, 0.23, 0.37, 0.15, 0.83, 0.61, 1.00, 0.08, 0.44])
thermo_equilibrium(16,  [0.16, 0.04, 0.72, 0.09, 0.17, 0.60, 0.26, 0.65, 0.69, 0.74, 0.45, 0.61, 0.23, 0.37, 0.15, 0.83, 0.61, 1.00, 0.08, 0.44])
thermo_equilibrium(20,  [0.16, 0.04, 0.72, 0.09, 0.17, 0.60, 0.26, 0.65, 0.69, 0.74, 0.45, 0.61, 0.23, 0.37, 0.15, 0.83, 0.61, 1.00, 0.08, 0.44])
thermo_equilibrium(14,  [0.16, 0.04, 0.72, 0.09, 0.17, 0.60, 0.26, 0.65, 0.69, 0.74, 0.45, 0.61, 0.23, 0.37, 0.15, 0.83, 0.61, 1.00, 0.08, 0.44])
thermo_equilibrium(40,  [0.16, 0.04, 0.72, 0.09, 0.17, 0.60, 0.26, 0.65, 0.69, 0.74, 0.45, 0.61, 0.23, 0.37, 0.15, 0.83, 0.61, 1.00, 0.08, 0.44]) # Gas particles(N) greater than length of r

# The number of time steps to reach equilibrium depends on the number of gas particles
## Yes
# Large number of particles, will the system always reach equilibrium?
## No
