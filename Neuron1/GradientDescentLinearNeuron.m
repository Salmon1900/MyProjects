function [FinalW, MSE,NumIterations,y,y1,Avg] = GradientDescentLinearNeuron(P,t, lr, ErrorGoal,MaxIterations)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

P(end+1,1:end)=1;
W=-0.1+0.2*rand(1,size(P,1));
y=W*P;
y1=y;
MSE=(1/size(P,2))*sum((t-y).^2);
i=2;
while i<MaxIterations & MSE>ErrorGoal
   W=W+(lr/size(P,2))*(t-y)*P';
   y=W*P;
   MSE(i)=(1/size(P,2))*sum((t-y).^2);
   i=i+1;
end
NumIterations=i;
FinalW=W;
%hold on
plot(MSE)
y=FinalW*P;
Avg=abs(t-y);
%plot (P(1,:),y)
end

