#/
Perfroms the LU factorizatin of a Hessenberg matrix
#/
function HessenLU(A)
    n = size(A)[1]
    for i = 1:n - 1
        factor = A[i + 1,i]/A[i,i]
        A[i+1,i] = factor #Writing in the L matrix
        for j = i+1:n
            A[i+1,j] = A[i+1,j] - factor * A[i,j]
        end
    end
end
