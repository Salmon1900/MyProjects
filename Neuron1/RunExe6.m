clear; clc; cla
load('Data16.mat')
hold on
for j=1:size(GradeExam1,2)
    if Accepted(j)==1
        plot(GradeExam1(j),GradeExam2(j),'.b')
    else
        plot(GradeExam1(j),GradeExam2(j),'.r')
    end
end
NGrades1=(GradeExam1-mean(GradeExam1))./(max(GradeExam1)-min(GradeExam1));
NGrades2=(GradeExam2-mean(GradeExam2))./(max(GradeExam2)-min(GradeExam2));
P=[NGrades1; NGrades2];
% Test1=([50 85]-mean(GradeExam1))./(max(GradeExam1)-min(GradeExam1));
% Test2=([62 87]-mean(GradeExam2))./(max(GradeExam2)-min(GradeExam2));
[FinalW, Cost,NumIterations,y,y1,Avg] = Classification(P,Accepted, 0.1, 0.01,1000)

max1=max(GradeExam1);
min1=min(GradeExam1);
max2=Point(max1,FinalW(1),FinalW(2),FinalW(3));
min2=Point(min1,FinalW(1),FinalW(2),FinalW(3));
plot([min1 max1],[min2 max2])
yn=zeros(size(y));
for i=1:length(y)
    if(y(i)>=0.5)
        yn(i)=1;
    else
        yn(i)=0;
    end
end