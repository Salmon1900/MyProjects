close all;clear all; cla; clc;
[x t] = house_dataset;
rng('shuffle')
net = fitnet(10);

[TInd,VIns,TeInd]=GetIndices(506,1);
% No feature normalization in input
net.inputs{1}.processFcns = {};
% No feature normalization in output:
net.outputs{2}.processFcns = {};
% No GUI
%net.trainParam.showWindow = 0;
for j=1:13
    xAvg(j)=mean(x(j,TInd));
    xRng(j)=max(x(j,TInd))-min(x(j,TInd));
    x(j,:)=(x(j,:)-xAvg(j))/(xRng(j));
end
tAvg=mean(t(1,TInd));
tRng=max(t(1,TInd))-min(t(1,TInd));
Nt(1,:)=(t(1,:)-tAvg)/(tRng);
       
[net tr] = train(net,x,Nt)

NOut=(net.LW{2,1}*tansig(net.IW{1,1}*x+repmat(net.b{1,1},1,506)))+repmat(net.b{2,1},1,506);
%NOut=net.LW{2,1}*(net.IW{1,1}*x);
Out=(NOut*tRng)+tAvg;

