close all
clear
clc
load('Data1.mat');
%plot(time,position,'.')
[FinalW, MSE,NumIterations,InitPos,InitVel,Pos11] = GradientDescentLinearNeuron2(time, position,0.01,7.6689,500)