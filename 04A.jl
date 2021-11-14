# Loops
## for-loop - known number of iterations
for i in 1:3 println(i) end

min_num = 10
max_num = 19
for i in min_num:max_num println(i) end

## While loop - indefinite number of iterations
the_sum = 0
i = 1
while the_sum < 3
    the_sum = the_sum + 1 / i
    println(the_sum)
    i += 1
end

## Breaking a loop - break statement
the_sum = 0
i = 1
while true
    the_sum = the_sum + 1 / i
    if the_sum >= 3
        break         # not recommended to use break statements - harder to read
    end
    println(the_sum)
    i += 1
end

# Loop pitfalls
## Return statement inside the loop - it will stop after reaching the return statement
## Off-by-one-error - Make sure to double check that the loop does not run one time too much or too little
## Infinite loop - In While loops check that the condition does in fact become false else stop manually

# Vectorized computation
x = [-2, -1, 0, 1, 2]
x[x.<0] .= 0
x = x.*2

## Vectorize for efficiency when it is appropriate
## When you cannot vectorize and you know how many times you need to loop, use a for-loop
## When you cannot vectorize and you do not know how many time you need to loop, use a while-loop


# Displaying formatted output
x = π
using Printf
@printf "The cosine of %f if %f" x cos(x)


# 04A.jl start
for i = 1:10
    println("I love programming!")
end

## Print sequence of numbers as multiples of 2
k = 1
for i in 1:10
    if i == 1
        k=2
        print(k)
        print(" ")
    elseif i == 10
        k*=2
        print(k)
        print(".")
    else
        k*=2
        print(k)
        print(" ")
    end
end

## Write a script uses a for-loop to print out the following
using Printf
for i ∈ 1:10
    @printf "The square root of %s is %.4f\n" i √i
end

## Write a script that uses a loop to print the train will leave every 20 minutes
using Dates
start_time = Time(13, 36)
while start_time <= Time(17, 16)
    println("The train will leave at " * Dates.format(start_time, "HH:MM") * " tomorrow")
    start_time += Minute(20)
end
