

function partPiv(A, b)
    rowLen = size(A)[1]
    map = [i for i = 1:rowLen]
    for k = 1:rowLen
        pivotRow = bestPivot(A, k, map)
        map[k], map[pivotRow] = map[pivotRow], map[k]
        for i = k+1:rowLen
            factor = A[map[i], k] / A[map[k], k]
            for j = k:rowLen
                A[map[i], j] = A[map[i], j] - factor * A[map[k], j]
            end # for
            b[map[i]] = b[map[i]] - factor * b[map[k]]
        end # for
    end # for
    xVec = [0.0 for i = 1:rowLen]
    for row = rowLen:-1:1 #back substitution
        sum = b[map[row]]
        for column = row + 1:rowLen
            sum = sum - A[map[row], column] * xVec[column]
        end
        xVec[row] = sum / A[map[row], row]
    end # for
    return xVec
end

function bestPivot(A, column, map)
    maxPivotRow = 0
    maxPivot = 0
    for row = column:length(map)
        pivot = abs(A[map[row], column])
        if pivot > maxPivot
            maxPivot = pivot
            maxPivotRow = row
        end#if
    end #for
    return maxPivotRow
end # function

test2 = [1.0 2.0 -2.0; 2.0 1.0 -5.0; 1.0 -4.0 1.0]
b = [-15.0 -21.0 18]
println(partPiv(test2,b))
