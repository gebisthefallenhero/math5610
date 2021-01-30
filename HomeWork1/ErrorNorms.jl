"""All return a p norm error between two different vectors """
function oneError(x,y)
    sum = 0.0
    for i = 1:length(x)
        sum += abs(x[i] - y[i])
    end
    return sum
end # function

function twoError(x,y)
    sum = 0.0
    for i = 1:length(x)
        sum += (x[i] - y[i])^2
    end
    return sqrt(sum)
end # function

function threeError(x,y)
    sum = 0.0
    for i = 1:length(x)
        sum += abs((x[i] - y[i]))^3
    end
    return sum^(1//3)
end # function
