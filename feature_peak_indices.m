function [x,y,z]=feature_peak_indices(data)
    % Find x position for the peak in each signal (x,y,z)
    % data: Nx3 matrix
    x=findsinglemax(data(:,1));
    y=findsinglemax(data(:,2));
    z=findsinglemax(data(:,3));
end

function mm=findsinglemax(vec)
    m=find(vec==max(vec));
    if length(m) > 1
        mm=m(1);
    else
        mm=m;
    end
end