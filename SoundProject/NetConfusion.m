function [ Confusion ] = NetConfusion( yR,t )
Confusion=zeros(4);
[C,output]=max(yR);
[C,target]=max(t);
 for j=1:size(yR,2)
   Confusion(output(j),target(j))=Confusion(output(j),target(j))+1.;      
 end

end

