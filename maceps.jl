function singlePoint()
    one = Float32(1.0)
    seps = Float32(1.0)
    appOne = Float32(1.0)
    for ipow = 1:1000
        seps = seps / 2
        appOne = one + seps
        if (abs(appOne == 1))
            return ipow
        end
    end
    println("Did not converge.")
end # function

function doublePoint()
    one = Float64(1.0)
    seps = Float64(1.0)
    appOne = Float64(1.0)
    for ipow = 1:1000
        seps = seps / 2
        appOne = one + seps
        if (abs(appOne == 1))
            return ipow
        end
    end
    println("Did not converge")
end
