
"""
Solves a system of equation Ax = b using scaled partial pivoting
A The matrix in the system of equations.
b the right had side vector.
"""
function scaledPartPiv(A,b)
    rowLen = length(b) #we are assuming rowLen = colLen
    map = [i for i=1:rowLen]
    maxVec = maxVector(A)
    for k =  1:rowLen #the row reduction
        pivotRow = bestPivot(A,k,maxVec,map)
        map[k],map[pivotRow] = map[pivotRow],map[k]
        for i=k+1:rowLen
            factor = A[map[i],k] / A[map[k],k]
            for j=k:rowLen
                A[map[i], j] = A[map[i], j] - factor * A[map[k], j]
            end # for
            b[map[i]] = b[map[i]] - factor * b[map[k]]
        end # for
    end # for
    xVec = [0.0 for i=1:rowLen]
    for row = rowLen:-1:1 #back substitution
        sum = b[map[row]]
        for column = row+1:rowLen
            sum = sum - A[map[row], column] * xVec[column]
        end
    xVec[row] = sum / A[map[row], row]
    end # for
    return xVec
end # function

""" Finds the maximum absolute value in each row of a matrix A """
function maxVector(A)
    maxVec = []
    for row = 1: size(A)[1]
        maxVal = 0
        for val in A[row,:]
            absVal = abs(val)
            if absVal > maxVal
                maxVal = absVal
            end # if
        end # for
        push!(maxVec,maxVal)
    end # for
    return maxVec
end #function


"""Returns the best pivot of a given column of A
A: The matrix in which you are finding the pivot in.
Column: Int the column which we start to consider
maxVec: The vector of the maximum absolute value of each row of A.
map: An array that is a map of the rows of A
return: The row value with the best pivot
"""
function bestPivot(A, column,maxVec,map)
    maxPivotRow = 0
    maxPivot = 0
    for row = column:length(map)
        pivot = abs(A[map[row], column] / maxVec[map[row]])
        if pivot > maxPivot
            maxPivot = pivot
            maxPivotRow = row
        end#if
    end #for
    return maxPivotRow
end # function

test2 = [1.0 2.0 -2.0; 2.0 1.0 -5.0; 1.0 -4.0 1.0]
b = [-15.0 -21.0 18]
maxVector(test2)
println(scaledPartPiv(test2,b))

println(test2 / b)
