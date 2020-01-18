LR=0.1;
x=zeros(1,100);
x(1)=7;
t=-10:0.1:10;
y=t.^2+t.*2+5;

for i=2:100
  %f=x(i)^2+2*(i)+5;
  fd=2*x(i-1)+2;
  x(i)=x(i-1)-LR*fd;
end
y2=x.^2+x.*2+5;
cla
hold on
plot(t,y)
plot(x,y2,'x')

