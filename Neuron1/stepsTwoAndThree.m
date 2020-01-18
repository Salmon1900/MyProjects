 load('Data1.mat')
 %plot(time,position)
[FinalW, MSE,NumIterations,y] = GradientDescentLinearNeuron(time,position, 0.05, 7.6689,500)