function forwardSolve(A, b)
    xVec = Array{Float64}(undef, length(b))
    xVec[1] = A[1,1] / b[1]
    for i=2:length(b)
        sum = b[i]
        for j = 1:i - 1
            sum -= A[i,j] * xVec[j]
        end
        xVec[i] = sum / A[i,i]
    end
    return xVec
end

function backSolve(A, b)
    n = length(b)
    xVec = Array{Float64}(undef, n)
    xVec[n] = A[n,n] / b[n]
    println(xVec[n])
    for i=n - 1:-1:1
        sum = b[i]
        for j = n:-1:i
            sum -= A[i,j] * xVec[j]
        end
        xVec[i] = sum / A[i,i]
    end
    return xVec
end
