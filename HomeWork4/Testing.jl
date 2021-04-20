include("GS.jl")
include("Jacobi.jl")

SIZE = 100
A = rand(SIZE,SIZE)
diagDomA = forceDiagDom(A)
b2 = diagDomA * [1.0 for i = 1:SIZE]
x_0 = [0.0 for i=1:SIZE]
tol = .001
jSum = jacobi(copy(diagDomA),copy(b2),copy(x_0),tol)
gSum = GS(copy(diagDomA),copy(b2),copy(x_0),tol)

function compareIterations(n)
    jSum = 0.0
    gSum = 0.0
    tol = .001
    for i=1:n
        SIZE = 100
        A = rand(SIZE,SIZE)
        diagDomA = forceDiagDom(A)
        b2 = diagDomA * [1.0 for i = 1:SIZE]
        x_0 = [0.0 for i=1:SIZE]
        jSum += jacobi(copy(diagDomA),copy(b2),copy(x_0),tol)
        gSum += GS(copy(diagDomA),copy(b2),copy(x_0),tol)
    end
    return jSum / n, gSum / n
end

jSum, gSum = compareIterations(10000)

function forceDiagDom(A)
    n = size(A)[1]
    for i=1:n
        sum = 0.0
        for j = 1:n
            sum += abs(A[i,j]) + 1
        end
        A[i,i] = sum
    end
    return A
end
