Ang=0:10:180;
Vel=0:10:1000;
[A,V]=meshgrid(Ang,Vel);
F=zeros(length(Vel),length(Ang));
OF=zeros(length(Vel),length(Ang));
for i=1:101
    for k=1:19
        Sol=[A(i,k),V(i,k)];
        [F(i,k),OF(i,k)]=CalculateFitnessScorch(Sol',1000000);
        close all
    end
    i
end