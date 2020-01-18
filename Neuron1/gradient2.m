close all;
clear all;
LR=0.05;
x=zeros(1,100);
x1=-10:0.3:10;
x2=-10:0.3:10;
[X1,X2]=meshgrid(x1,x2);
f=X1.^2+X2.^2+X1.*X2;
hold on
surf(x1,x2,f)
dx1=10;
dx2=10;
pause(3);

for i=1:50
    dx=[dx1;dx2];
  fd1=2.*dx1+dx2;
  fd2=2.*dx2+dx1;
  fd=[fd1,fd2];
  dx=dx-LR.*fd;
  dx1=dx(1);
  dx2=dx(2);
  h=plot3(dx1,dx2,(dx1^2+dx2.^2+dx1*dx2),'.r','MarkerSize',20);
  pause(0.2)
  delete(h)
end
