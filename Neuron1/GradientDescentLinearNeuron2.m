function [FinalW, MSE,NumIterations,InitPos,InitVel,Pos11] = GradientDescentLinearNeuron2(P,t, lr, ErrorGoal,MaxIterations)

P(2,:)=1;
W=(rand(1,size(P,1))/5)-0.1;
NumIterations=1;
n=size(P,2);  % sum(t-w*p)^2
CurrentMSE(NumIterations)=(1/n)*sum((t-(W*P)).^2);
while CurrentMSE>ErrorGoal & NumIterations<=MaxIterations

     Wnew =W + lr*((1/n)*(t-(W*P))*P');
     W=Wnew;
     CurrentMSE(NumIterations)=(1/(n))*sum(((t-(W*P)).^2));
     NumIterations=NumIterations+1;
end
FinalW=W;
MSE=CurrentMSE;
hold on
plot(MSE);
y=FinalW*P;
figure
plot(P(1,:),t,'.')
hold on
plot (P(1,:),y)
InitPos=y(1,1)
InitVel=(y(1,2)-y(1,1))/0.5
Pos11=FinalW*[11 1]'
end

