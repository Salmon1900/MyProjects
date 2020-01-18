load('Data2.mat');
test=[0 1;6000 25000;15 0;67 83]
%Data=[Data test];
NormalData=zeros(size(Data,1),size(Data,2));
for j=1:4
  NormalData(j,:)=(Data(j,:)-mean(Data(j,:)))./(max(Data(j,:))-min(Data(j,:)));  
end
for i=1:4
    Ntest(i,:)=(test(i,:)-mean(Data(i,:)))./(max(Data(i,:))-min(Data(i,:)))
end
[FinalW, MSE,NumIterations,y,y1,Avg] = GradientDescentLinearNeuron(NormalData , LifeLength, 0.05, 0.0833,500)