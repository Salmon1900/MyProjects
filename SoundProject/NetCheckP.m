function [ y,yR ] = NetCheckP(P,IW,LW,b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y=softmax(LW{2}*tansig(IW{1}*P+b{1})+b{2});
[C,output]=max(y);
yR=zeros(2,size(y,2));
for j=1:size(y,2)
  yR(output(j),j)=1;
end
end

