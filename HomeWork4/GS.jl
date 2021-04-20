include("../HomeWork1/PNorms.jl")

function GS(A,b,guess, tol; maxIter = 1000)
    n = size(A)[1]
    x_old = guess
    x_new = zeros(n)
    res = b - A * x_old
    count = 1
    while twoNorm(res) > tol &&  count < maxIter
        for i = 1:n
            backSum = 0.0
            for j = 1:i-1
                backSum += A[i,j] * x_new[j]
            end
            innerSum = 0.0
            for j = i + 1:n
                innerSum += A[i,j] * x_old[j]
            end
        x_new[i] = (b[i] - backSum - innerSum) / A[i,i]
        end
        x_old = x_new
        res = b - A * x_new
        count += 1
    end
    return x_new
end

A = [10.0 2.0 1.0; 3.0 20.0 4.0; 4.0 4.0 20.0]
b = [5.0; 17.0; 26.0]
x_0 = [0.0; 0.0; 0.0]
tol = .001
answer = GS(A,b,x_0,tol)
println(answer)
println(A * answer)
