w=zeros(1,100);
close all;
w(1)=-7;
LR=1
hold on
x=-10:0.1:10;
y=x.^2+2.*x+5;
plot(x,y)
for i=2:100
f=w(i-1)^2+2*w(i-1)+5;
fd=2*w(i-1)+2;
w(i)=w(i-1)-LR*fd;
h=plot(w(i-1),f,'x')
pause(0.2)
delete(h)
end