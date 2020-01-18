function [ y ] = NetCheck(P,IW,LW,b)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y=LW{2}*tansig(IW{1}*P+repmat(b{1},1,506))+repmat(b{2},1,506);
yn=zeros(1,506);



end

