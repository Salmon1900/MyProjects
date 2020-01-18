function [Success_Test,Success_Train ] = NetSuccess( P,t,IW,LW,b,TrainingInd,TestInd)
t_Train=t(:,TrainingInd);
t_Test=t(:,TestInd);
[ y,yR ]=NetCheckP(P,IW,LW,b );
yR_Train=yR(:,TrainingInd);
yR_Test=yR(:,TestInd);
[C,output]=max(yR_Test);
[C,target]=max(t_Test);
Correct=eq(target,output);
Success_Test=(100*sum(Correct))./(length(TestInd));
[C,output]=max(yR_Train);
[C,target]=max(t_Train);
Correct=eq(target,output);
Success_Train=(100*sum(Correct))./(length(TrainingInd));
end

