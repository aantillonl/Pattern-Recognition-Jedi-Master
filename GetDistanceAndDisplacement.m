function [ totalDistance, totalDisplacement ] = GetDistanceAndDisplacement( a )
%GETDISPLACEMENT Summary of this function goes here
%   Detailed explanation goes here

totalDistance = zeros(size(a,2),1);
totalDisplacement = zeros(size(a,2),1);
v = zeros(size (a));
vi = 0;
for j =1:size(a,2);
    m = mean (a(:,j));
    a(:,j) = a(:,j) - m;
    %maxa = max(a(:,j));
    %a(:,j) = a(:,j)/maxa;   
    dv = 0;
    increment = 0.01;
    v(1) = vi;
    x = 0;
    while(x < size(a,1) - 1)
        x0 = floor(x);
        x1 = x0 + 1;

        y0 = a(x0 + 1, j);
        y1 = a(x1+1, j);

        y = y0 + (y1- y0)*((x-x0)/(x1 - x0));
        dv = dv + (increment * y);
        v(x1+1,j) = vi + dv;    
        x = x + increment;
    end    
    x = 0;
    while(x < size(a,1) - 1)
        x0 = floor(x);
        x1 = x0 + 1;

        y0 = v(x0 + 1, j);
        y1 = v(x1+1, j);

        y = y0 + (y1- y0)*((x-x0)/(x1 - x0));
        totalDisplacement(j) = totalDisplacement(j) + (increment * y);
        totalDistance(j) = totalDistance(j) + abs((increment * y));
        x = x + increment;
    end
end
end

