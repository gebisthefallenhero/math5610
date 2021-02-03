"""Returns the dotproduct of two vectors """
function dotProd(x,y)
    sum = 0.0
    for i=1:length(x)
         sum += x[i]*y[i]
    end
    return sum
end
