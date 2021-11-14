# true or false

if π < 3
    println("Condition is true")
else
    println("Condition is false")
end

x = 10;
if x < 5
    println("Condition is true")
else
    println("Condition is false")
end

x = 5;
if (π > 3) & (x == 5)
    println("Condition is true")
else
    println("Condition is false")
end

if (π < 3) | (5 == 5)
    println("Condition is true")
else
    println("Condition is false")
end

# Other conditions
Bool(0) == true
Bool(44) # InexactError
"" # Empty string
"hello" # non-Empty string
"false" # the string false
[0, 1]  # TypeError
