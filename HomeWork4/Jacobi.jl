include("../HomeWork1/PNorms.jl")

function jacobi(A,b,guess,tol; maxIter = 1000)
    lenD = size(A)[1]
    x = guess
    res = b - A * x
    count = 1
    while twoNorm(res) > tol && count < maxIter
        count += 1
        for i=1:lenD
            x[i] = x[i] + res[i] * 1 / A[i,i]
        end
        res = b - A * x
    end
    return x
end

A = [10.0 2.0 1.0; 3.0 20.0 4.0; 4.0 4.0 20.0]
b = [5.0; 17.0; 26.0]
x_0 = [0.0; 0.0; 0.0]
tol = .001
answer = jacobi(A,b,x_0,tol)
println(answer)
println(A * answer)
