function [HitCoord,PixelsInLand] = Land(Traj);
% This function gets a 2*m trajectory and return the x,y coordinates of
% hitting the land (or [0,0] if there is no hitting), and the number of pixels the trajectory went through
% the land.
load('PermanentConditionsForFitness');
Traj = round(Traj);
% 1) calculating number of pixels in land:
inland = zeros(1,size(Traj,2));
    for k = 1:size(Traj,2) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% check!
        if Traj(1,k)>0 & Traj(1,k)<=size(LandSky,2) & Traj(2,k)>0 & Traj(2,k)<=size(LandSky,1) % part of trajectory within figure
            if Traj(1,k)<xEnemy %since land AFTER the x position of the enemy's tank doesn't matter
            % found hiting the ground
            inland(k) = LandSky(Traj(2,k),Traj(1,k));
            end
        end
    end
    % in the length of the trajectory, with 0 when it is in the air,
    % and 1 when it is in the land
 PixelsInLand = sum(inland);
 
 % 2) calculating the hitting in land coordinates:
 inland = zeros(1,size(Traj,2));
for k = 1:size(Traj,2) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% check!
        if Traj(1,k)>0 & Traj(1,k)<=size(LandSky,2) & Traj(2,k)>0 & Traj(2,k)<=size(LandSky,1) % part of trajectory within figure
            inland(k) = LandSky(Traj(2,k),Traj(1,k));
        end
end
    
firstland = find(inland==1,1);
if ~isempty(firstland)% there is contact with land
    HitCoord = Traj(:,firstland);
else
    HitCoord = [0;0];
end