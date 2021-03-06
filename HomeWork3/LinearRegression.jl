
function linReg(data)
    #@param data: an array of the ordered pairs (x,y)
    A = zeros(2,2)
    r = zeros(2)
    for i in 1:size(data)[2]
        A[1,1] += data[1,i]^2
        A[2,1] += data[1,i]
        A[2,2] += 1
        r[1] += data[2,i] * data[1,i]
        r[2] += data[2,i]
    end
    detA = 1 / (A[2,2] * A[1,1] - A[2,1]^2)
    a = (A[2,2] * r[1] - A[2,1] * r[2]) * detA
    b = (-A[2,1] * r[1] + A[1,1] * r[2]) * detA
    return a,b
end

using Plots
f(x) = 2*x + 3
xVals = 0:.01:10
fVals = [f(x) for x in xVals]
maxfVal = 23
plot(xVals,f,label="Linear Function")

dataPoints = zeros(2,size(xVals)[1])
count = 1
for val in xVals
    dataPoints[1,count] = val
    test = rand()
    dataPoints[2,count] = f(val) + 23 * .05 * rand()
    count += 1
end

a,b = linReg(dataPoints)

f_1(x) = a*x + b

plot!(xVals,f_1,label="Regression with noise")
