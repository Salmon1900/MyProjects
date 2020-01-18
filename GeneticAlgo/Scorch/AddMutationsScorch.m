function Mutated = AddMutationsScorch( Original,Pm )
Mutated=zeros(2,1);
% Angle Mutations
r1=rand();
if(r1<Pm)
   Ran=rand();
   if(Ran<0.25)
       Mutated(1)=Original(1)+1;
   elseif(Ran<0.5)
       Mutated(1)=Original(1)-1;
   elseif(Ran<0.75)
       Mutated(1)=Original(1)+4;
   else
       Mutated(1)=Original(1)-4;
   end
end
% Angle limit check
if(Mutated(1)<0)
    Mutated(1)=0;
end

if(Mutated(1)>180)
    Mutated(1)=180;
end
% Speed Mutations
r1=rand();
if(r1<Pm)
   Ran=rand();
   if(Ran<0.25)
       Mutated(2)=Original(2)+1;
   elseif(Ran<0.5)
       Mutated(2)=Original(2)-1;
   elseif(Ran<0.75)
       Mutated(2)=Original(2)+31;
   else
       Mutated(2)=Original(2)-31;
   end
end
% Speed limit check
if(Mutated(2)<0)
    Mutated(2)=0;
end

if(Mutated(2)>1000)
    Mutated(2)=1000;
end

end

