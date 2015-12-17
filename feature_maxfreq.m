function [fx,fy,fz,mx,my,mz]=feature_maxfreq(data)
    % Find maximum frequencies for each signal (x,y,z)
    % data: Nx3 matrix
    Fs = 100; % wiimote data rate
    [mx,fx]=findmax(data(:,1),Fs);
    [my,fy]=findmax(data(:,2),Fs);
    [mz,fz]=findmax(data(:,3),Fs);

end

function [magn,freq]=findmax(X,Fs)
    X = [X;X;X];
    [f,P1]=simplefft(X,Fs);
    %P1 = P1(2:end);
    magn = max(P1);
    if length(magn) > 1
        magn = magn(1);
    end
    freq = find(P1==max(P1));
end
