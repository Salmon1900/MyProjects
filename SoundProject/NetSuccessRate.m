clear all; 
%load('DataMfcc.mat');
%load('MfccRms.mat');
%load('DataMfccRmsBright.mat');
%load('MfccBright');
%load('RmsBrightness.mat');
%load('Rms.mat');
%load('Brightness.mat');
load('DataFinal');
S=[];
for k=95
for i=1:20
rng('Shuffle');
net=patternnet(k);
net.layers{1}.transferFcn='tansig';
net.trainParam.showWindow=0;
[TrainingInd, ValidationInd,TestInd]=GetIndices(300,2);
net.divideFcn = 'divideind';
net.divideParam.trainInd =TrainingInd;
net.divideParam.testInd =TestInd;
net.divideParam.valInd =ValidationInd;
net.inputs{1}.processFcns={};
net.outputs{2}.processFcns={};
[net, tr ] =train(net,p,t);
[ y,yR ] = NetCheckP(p,net.IW,net.LW,net.b );
[STest(i),STrain(i) ] = NetSuccess(p,t,net.IW,net.LW,net.b,TrainingInd,TestInd);
end
SRTrain(1)=mean(STrain);
SRTest(1)=mean(STest);
end