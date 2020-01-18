%clear; clc
%RunProject
r=[];

for i=1:150
%dat=audioread(['Recording (' int2str(i) ').m4a']);
%dat=audioread(['a (' int2str(i) ').flac']);
dat=audioread(['m' int2str(i) '.m4a']);
dat=dat(:,1);
obj=miraudio(dat);
mfcc=mirmfcc(obj);
dmfcc=mirgetdata(mfcc);
rms=mirrms(obj);
drms=mirgetdata(rms);
bright=mirbrightness(obj);
dbright=mirgetdata(bright);
p1=[dmfcc' drms dbright]';
result=net(p1);
if(result(1,1)>result(2,1))
    %disp('Male')
    r=[r 1];
else
    %disp('Female')
    r=[r 0];
end
end