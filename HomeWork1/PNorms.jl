function oneNorm(vec)
    sum = 0.0
    for x in vec
        sum += abs(x)
    end
    return sum
end # function

function twoNorm(vec)
    sum = 0.0
    for x in vec
        sum += abs(x)^2
    end
    return sqrt(sum)
end #

function threeNorm(vec)
    sum = 0.0
    for x in vec
        sum += abs(x)^3
    end
    return sum^(1//3) #Double backslash means rational term.
end #
