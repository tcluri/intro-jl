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

using CSV
using DataFrames
# Main script
function mainScript()
    println("Welcome!")
    function readFile()
        file_name = ""
        while true
            println("Enter the name of the file that contains grades of assignments of students: ")
            file_name = readline()
            if isfile(file_name)
                println("File exists")
                break
            else
                println("File doesn't exist. Try again")
            end
        end
        file_data = CSV.File(file_name) |> DataFrame
        rows, cols = size(file_data)
        println("Number of students are ", rows)
        println("Number of assignments for each student are ", cols-2)
        return file_data, rows, cols
    end
    file_data, rows, cols = readFile()
    while true
        println("Please enter a number from the following options.")
        println("1. Load data")
        println("2. Check for data errors")
        println("3. Generate plots")
        println("4. Display list of grades")
        println("5. Quit")
        println("The choice: ")
        inp_num = readline()
        try
	          inp_num = parse(Int, inp_num)
            if inp_num ∈ [1, 2, 3, 4, 5]
                if inp_num == 5
                    println("Goodbye!")
                    break
                else
                    if inp_num ∈ [2, 3, 4]
                        if inp_num == 2
                            println("Checking for data errors...")
                            # Check if two students in the data have the same student id
                            id_freq = countmap(file_data[!, "StudentID"])
                            for (key, value) in id_freq
                                if value > 1
                                    println("Students whose student id is the same!!")
                                    println(file_data[file_data[!, "StudentID"] .== key, :])
                                else
                                    continue
                                end
                            end
                            # Check if the grades are not in the 7-step scale
                            get_req_cols = names(file_data)[3:end]
                            grade_check = file_data[!, get_req_cols]
                            for (ind, row) in enumerate(grade_check)
                                row_check =  -3 .<= row .<= 12
                                if ~all(row_check)
                                    println("Error in grades in row number: ", ind)
                                    println(file_data[ind, :])
                                end
                            end
                        elseif inp_num == 3
                            gradesPlot(Matrix(file_data[:, 3:end]))
                        elseif inp_num == 4
                            # List of grades by each assignment
                            file_data[!, "Final grade"] = computeFinalGrades(Matrix(file_data[:, 3:end]))
                            sort!(file_data, [:Name])
                            # Printing the dataframe itself instead of neat strings
                            println(file_data)
                        end
                    else
                        println("Loading the data...")
                        file_data, rows, cols = readFile()
                    end
                end
            end
        catch MethodError
            println("The number should be between 1 and 5. Try again")
            continue
        end
    end
end

mainScript()
