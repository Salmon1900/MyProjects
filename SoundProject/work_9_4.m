cla;close all; clear all; clc;
load('HouseDataset');
MSE=[];
Idealnum=20;
X=x;
for i=1:13
    disp(i)
    x(i,:)=[];
    for k=1:20
        net=fitnet(Idealnum);
        net.inputs{1}.processFcns={};
        net.outputs{2}.processFcns={};
%       net.trainParam.showWindow=0;
        [TrainingInd, ValidationInd,TestInd]=GetIndices(506,1);
        net.divideParam.trainInd =TrainingInd;
        net.divideParam.testInd =ValidationInd;
        net.divideParam.valInd =TestInd;
        P=zeros(12,506);
        T=zeros(1,506);
        for j=1:12
            P(j,:)= (x(j,:)-mean(x(j,TrainingInd)))/(max(x(j,TrainingInd))-min(x(j,TrainingInd)));
        end
        T= (t-mean(t(TrainingInd)))/(max(t(TrainingInd))-min(t(TrainingInd)));
        [net, tr ] =train(net,P,T);
        [y]=NetCheck(P,net.IW,net.LW,net.b);
        ydn=y*(max(t(TrainingInd))-min(t(TrainingInd)))+mean(t(TrainingInd));
        CurrentMSE=(1/size(x,2))*sum((t-ydn).^2);
    end
    k=1;
    j=1;
    x=X;
    MSE=[MSE CurrentMSE];
end
plot(MSE)
grid on