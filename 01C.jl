# Help on functions

## type ? in the repl to get help on functions

## Calculate sine of angles in radians
sin(0.5π)
sin(90)

round
floor
ceil
# fix - there is no fix function in julia
floor(2.5)
ceil(-3.6)
round(3.4) == ceil(3.4)
round(-3.4) == ceil(-3.4)

# Given number 1234.56789
round(1234.56789, digits=3)
round(1234.56789, digits=1)
round(Int, 1234.56789)
# round to 1200 round(1234.56789)

# log function
# find base value using help
# log(ℯ) vs log10
log(ℯ)
log10(10)
