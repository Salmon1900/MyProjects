cla;clear all;close all;clc;
load('HouseDataset')
NumHiddenNeurons=[];
MeanPerformanceTrain=[];
MeanPerformanceVal=[];
for m=[20]
  for i=1:20
    disp(i)
    rng('shuffle')
    net=fitnet(m);
    net.inputs{1}.processFcns={};
    net.outputs{2}.processFcns={};
%     net.trainParam.showWindow=0;
   [TrainingInd, ValidationInd,TestInd]=GetIndices(506,1);
   net.divideParam.trainInd =TrainingInd;
   net.divideParam.testInd =ValidationInd;
   net.divideParam.valInd =TestInd;
   P=zeros(13,506);
   T=zeros(1,506);
   for j=1:13
     P(j,:)= (x(j,:)-mean(x(j,TrainingInd)))/(max(x(j,TrainingInd))-min(x(j,TrainingInd)));
   end
   T= (t-mean(t(TrainingInd)))/(max(t(TrainingInd))-min(t(TrainingInd)));
   [net, tr ] =train(net,P,T);
   [ y ]=NetCheck(P,net.IW,net.LW,net.b);
   ydn=y*(max(t(TrainingInd))-min(t(TrainingInd)))+mean(t(TrainingInd));
   avgErrTr(i)=mean(abs(ydn(TrainingInd)-t(TrainingInd)));
   avgErrVal(i)=mean(abs(ydn(ValidationInd)-t(ValidationInd)));
   avgErr(i)=mean(abs(ydn(TestInd)-t(TestInd)));
  end
   i=1;
   j=1;
   NumHiddenNeurons=[NumHiddenNeurons m];
   MeanPerformanceTrain=[MeanPerformanceTrain mean(avgErrTr)];
   MeanPerformanceVal=[MeanPerformanceVal mean(avgErrVal)];
   MeanPerformanceTest=mean(avgErr)
end
axis([0 84 0 5])
plot(NumHiddenNeurons,MeanPerformanceVal)
title('Mean preformance of validation as a function of hidden Neurons')
ylabel('Mean of preformance')
xlabel('Number of hidden neurons')
figure
plot(NumHiddenNeurons,MeanPerformanceTrain)
title('Mean preformance of training as a function of hidden Neurons')
ylabel('Mean of preformance')
xlabel('Number of hidden neurons')



