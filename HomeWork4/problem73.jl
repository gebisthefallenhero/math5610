include("../HomeWork1/PNorms.jl")
A = [10.0 1.0 1.0; 1.0 10.0 1.0; 1.0 1.0 10.0]
b = [12.0; 12.0; 12.0]
x = zeros(3)
tol = .000000000001
iter1 = jacobi(A,b,x,tol; maxIter = 2)
iter2 = jacobi(A,b,iter1,tol; maxIter = 2)
iter3 = GS(A,b,iter2,tol; maxIter = 2)

ones = [1.0; 1.0; 1.0]
println(oneNorm(ones - iter1))
println(oneNorm(ones - iter2))
println(oneNorm(ones - iter3))
