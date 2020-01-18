clear all; 
load('DataFinal.mat');
rng('Shuffle');
net=patternnet(95);
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
[STest,STrain] = NetSuccess(p,t,net.IW,net.LW,net.b,TrainingInd,TestInd);


