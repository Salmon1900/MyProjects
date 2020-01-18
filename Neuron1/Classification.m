function [FinalW, Cost,NumIterations,y,y1,Avg] = Classification(P,t, lr, ErrorGoal,MaxIterations)

P(end+1,1:end)=1;
W=-0.1+0.2*rand(1,size(P,1));
y=1./(1+exp(-(W*P)));
y1=y;
Cost=(-1/size(P,2)).*sum(t*log(y')+(1-t)*(log(1-y')));
i=2;
while i<MaxIterations & Cost>ErrorGoal
   W=W+(lr/size(P,2))*((t-y)*P');
   y=1./(1+exp(-(W*P)));
   Cost(i)=(-1/size(P,2))*sum(t*log(y')+(1-t)*(log(1-y')));
   i=i+1;
end
NumIterations=i;
FinalW=W;
hold on
% plot(Cost)
y=1./(1+exp(-(FinalW*P)));
Avg=abs(t-y);
%plot (P(1,:),y)
end

