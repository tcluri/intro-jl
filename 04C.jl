# Square roots of a positive number
function sqr_root(a)
    x = a/2
    count = 0
    while count < 10
        x = (x + (a/x))/2
        count += 1
        println("Number of iterations: $count")
        println("The value of x: $x")
    end
end

## It takes 3 iterations to get the √2 correct upto five significant digits
sqr_root(2) # After 3 iterations x = 1.41421
sqr_root(2_123_876_453)
