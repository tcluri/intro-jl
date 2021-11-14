# Logical expressions
9 > 3 * 3
9 ≥ 3 * 3
(6+3) == 3^2
12/5 > 17/5
2>3 | 3^2!=9
323 != 17*19
cos(3*π) < 0

# Comparision pitfalls
## Intervals
x = 1
0.5 ≤ x ≤ 1.5
## Comparision vectors
a = [1, 2, 3]
b = [1, 2, 3, 4]
a == b
isequal(a, b)
## Comparing decimals numbers
√(2) ^ 2 == 2 # is true
## Comparing strings
"abc" == "abcd"
"abc" == lowercase("ABC")
