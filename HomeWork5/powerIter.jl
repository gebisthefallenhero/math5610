include("../HomeWork1/PNorms.jl")
using LinearAlgebra

function powerIter(A,x_0,tol; maxIter = 1000)
    error = tol * 10.0
    iter = 0
    λ0 = 0
    y = x_0
    z = nothing # initializing z
    while error > tol && iter < maxIter
        v = A * y
        normV = twoNorm(v)
        v = v ./ normV
        z = A * v
        λ1 = dot(z,v)
        error = abs(λ1 - λ0)
        λ0 = λ1
        y = v
        iter += 1
    end #while
    return λ0, z
end

A = [0.0 1.0; -2.0 -3.0]
x_0 = [1; 1]
tol = .001
print(powerIter(A,x_0,tol))

function hilbert(n)
#returns a hilbrt matrix of size n x n
    A = zeros(n,n)
    for i = 1:n
        for j = 1:n
            A[i,j] = 1 / (i + j - 1)
        end
    end
    return A
end

sizes = [8,16,32,1000]
tol = .00001
for val in sizes
    println("Poweriter eigenval $(powerIter(hilbert(val),ones(val),tol)[1]) for hilbert matrix of size $(val)")
    println("Julia builtin eigenvalue $(eigvals(hilbert(val))[end]) for hilbert matrix of size $(val)")
end
