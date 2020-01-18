function [Fitness,OriginalFitness] = CalculateFitnessScorch( Population,Lambda )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 load('PermanentConditionsForFitness');
SizeP=size(Population);
Fitness=zeros(1,SizeP(2));
OriginalFitness=zeros(1,SizeP(2));
AngleR=((Population(1,1:end))*pi)/180;
figure
imagesc(LandSky)
axis xy
hold all
ViX=Population(2,1:end).*cos(AngleR);
ViY=Population(2,1:end).*sin(AngleR);
xLeft=xEnemy-blastrad;xRight=xEnemy+blastrad;
yTop=yEnemy+blastrad;yBottom=yEnemy-blastrad;
for b=1:length(ViX)
    k=1;
    for t=0:simulationdelta:tmax
        X(k,b)=xTank+ViX(b)*t+(wind*t^2)/2;
        Y(k,b)=yTank+ViY(b)*t-(gravity*t^2)/2;
        k =k+1;
    end
    plot(X(:,b),Y(:,b))
    drawnow
    Distance=sqrt((X(:,b)-xEnemy).^2+(Y(:,b)-yEnemy).^2);
    MinDis=min(Distance);
    [HitCoord,PixelsInLand]=Land([X(:,b)';Y(:,b)']);
   OriginalFitness(b)=MinDis+Lambda*PixelsInLand;
   Fitness(b)=1/(1+OriginalFitness(b));
   if(HitCoord(1)>xLeft&&HitCoord(1)<xRight&&HitCoord(2)>yBottom&&HitCoord(2)<yTop)
       Fitness(b)=1;
       OriginalFitness(b)= 0;
   end
   
end
end

