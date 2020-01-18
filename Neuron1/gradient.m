close all
LR=0.1;
x=zeros(1,100);
x1= pi/2+0.01 ;
c=-2*pi:0.01:2*pi
f=sin(c)
hold on
plot(c,f)
for i=1:150
  x(i)=x1;
  fd=cos(x1);
  x1=x1-LR*fd
  h=plot(x(i),sin(x(i)),'.r','MarkerSize',20)
  pause(0.2)
  delete(h)
end