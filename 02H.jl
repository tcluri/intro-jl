# Sudoku row
function fill_sudoku_row(sudoku_row::Vector{Int})
    sudoku_row[findfirst(isequal(0), sudoku_row)] = 45 - sum(sudoku_row)
    return sudoku_row
end
