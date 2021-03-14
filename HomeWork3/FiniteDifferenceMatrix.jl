function MakeTriDiag(numIntervals)
    ad = zeros(numIntervals)
    al = zeros(numIntervals - 1)
    as = zeros(numIntervals - 1)
    for i=1:numIntervals
        ad[i] = 2
    end
    for i=1:numIntervals - 1
        al[i] = -1
        as[i] = -1
    end
    return ad,al,as
end


function TriDiagLU(ad,al,as)
    n = length(ad)
    for k=1:n - 1
        factor = al[k] / ad[k]
        ad[k + 1] = ad[k + 1] - factor * as[k]
        al[k] = factor
    end
    return ad,al,as
end

function TriDiagSolve(b,numIntervals)
    ad,al,as = MakeTriDiag(numIntervals)
    ad,al,as = TriDiagLU(ad,al,as)
    println(al)
    y = TriDiagFS(al,b)
    return TriDiagBS(ad,as,y)
end

function TriDiagFS(al,b)
    n = length(b)
    y = zeros(n)
    y[1] = b[1]
    for i=2:n
        y[i] = b[i] - al[i - 1] * y[i - 1]
    end
    return y
end

function TriDiagBS(ad,as,y)
    n = length(ad)
    x = zeros(n)
    x[n] = y[n]/ ad[n]
    for i = n - 1:-1:1
        x[i] = (y[i] - as[i] * x[i + 1]) / ad[i]
    end
    return x
end
