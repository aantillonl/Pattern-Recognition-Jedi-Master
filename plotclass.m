function plotclass(data, k, limit)

if limit > 0
    N=limit;
else
    N=length(data);
end

figure('name',sprintf('Class %d',k))

axes = ['x','y','z'];
for a=1:3
    c = 0;
    subplot(3,2,a*2-1)
    title(sprintf('%s axis',axes(a)))
    hold on
    for i=1:length(data)
        if data{i}.class == k
            plot(data{i}.data(:,a),'Color',autocolor(i))
            c = c + 1;
        end
        if limit > 0 && c >= limit
            break
        end
    end
    
    % test FFT
    Fs = 97;
    X = data{i}.data(:,a);
    X = [X;X;X];
    [f,P1]=simplefft(X,Fs);
    subplot(3,2,a*2);
    bar(f,P1),axis([0 Fs/2 0 max(P1)]);
    
    
end
