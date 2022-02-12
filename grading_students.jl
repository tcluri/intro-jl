# Program for grading students
function roundGrade(grades)
    grade_scale = [12, 10, 7, 4, 2, 0, -3]
    abs_sub(x) = [round(y<0 ? (x<0 ? -(x-y) : x-y) : (x<0 ? (y-x) : max(x,y) - min(x,y)), digits=2) for y in grade_scale]
    rounded_grades = Vector{Int}()
    for each_grade in grades
        # Calcualte the difference with all the grades
        abs_sub_list = abs_sub(each_grade)
        least_distance = minimum(abs.(abs_sub_list))
        least_distance_indices = [ind for (ind, each_abs_sub) in enumerate(abs_sub_list) if each_abs_sub == least_distance]
        if each_grade > 0
            append!(rounded_grades, grade_scale[minimum(least_distance_indices)])
        else
            append!(rounded_grades, grade_scale[maximum(least_distance_indices)])
        end
    end
    return rounded_grades
end


function computeFinalGrades(grades)
    # grades is NxM matrix where N is the number of students
    rows, cols = size(grades)
    if cols == 1
        grades_final = roundGrade(grades[:, cols])
    else
        grades_final = Vector{Int}()
        for row in eachrow(grades)
            if -3 ∈ row
                append!(grades_final, -3)
                continue
            end
            append!(grades_final, roundGrade([((sum(row)-minimum(row))/(cols-1))]))
        end
    end
    return grades_final
end

using Plots
using StatsBase  # for countmap
using Distributions
function gradesPlot(grades)
    grade_scale = [12, 10, 7, 4, 2, 0, -3]
    # Final grades - using computeFinalGrades
    calc_grades = computeFinalGrades(grades)
    grades_freq = countmap(calc_grades)
    grades_freq = Dict(grade_given => get(grades_freq, grade_given, 0) for grade_given in grade_scale)
    bar(grades_freq, xticks=grade_scale, legend=false)
    xlabel!("Grade 7-step-scale")
    ylabel!("Number of students")
    title!("Each possible final grades on the 7-step scale")
    savefig("./plots/final-grades.svg")
    # Grades per assignment
    rows, cols = size(grades)
    x_vars = Vector{Float64}()
    y_vars = Vector{Float64}()
    avg_grades = Vector{Float64}()
    for x in 1:cols
        for y in 1:rows
            x_point = x + rand(Uniform(-0.1, 0.1))
            y_point = grades[y, x] + rand(Uniform(-0.1, 0.1))
            append!(x_vars, x_point)
            append!(y_vars, y_point)
        end
        append!(avg_grades, mean(grades[:, x]))
    end
    scatter(x_vars, y_vars, color=:blue, label=false, legend=:bottomright)
    plot!(1:cols, avg_grades, color=:green, label="Average grade/assignment")
    yticks!(grade_scale)
    xticks!(1:cols)
    title!("Grades per assignment")
    xlabel!("Number of assignments")
    ylabel!("Grading scale")
    savefig("./plots/grades-per-assignment.svg")
end
