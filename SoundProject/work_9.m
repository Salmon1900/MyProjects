cla;clear all;close all;clc;
load('HouseDataset')
rng('shuffle')
P=zeros(13,506);
T=zeros(1,506);
net=fitnet(10);
net.inputs{1}.processFcns={};
net.outputs{2}.processFcns={};
net.trainParam.showWindow=0;
[TrainingInd, ValidationInd,TestInd]=GetIndices(506,1);
net.divideParam.trainInd =TrainingInd;
net.divideParam.testInd =ValidationInd;
net.divideParam.valInd =TestInd;
for i=1:13
P(i,:)= (x(i,:)-mean(x(i,TrainingInd)))/(max(x(i,TrainingInd))-min(x(i,TrainingInd)));
end
T= (t-mean(t(TrainingInd)))/(max(t(TrainingInd))-min(t(TrainingInd)));
[net, tr ] =train(net,P,T);
[ y ]=NetCheck(P,net.IW,net.LW,net.b);
% denormalization
ydn=y*(max(t(TrainingInd))-min(t(TrainingInd)))+mean(t(TrainingInd));
figure(1)
plot(tr.epoch,tr.perf)
title('training cross entropy')
ylabel('cross entropy value')
xlabel('epochs')
figure(2)
plot(tr.epoch,tr.vperf)
title('validation cross entropy')
ylabel('cross entropy value')
xlabel('epochs')
figure(3)
plot(tr.epoch,tr.tperf)
title('test cross entropy')
ylabel('cross entropy value')
xlabel('epochs')
MSE=(1/size(x(TestInd),2))*sum((t(TestInd)-ydn(TestInd)).^2);
avgErr=mean(abs(ydn(TestInd)-t(TestInd)))
figure(4)
plot(ydn(TestInd))
hold on
plot(t(TestInd))