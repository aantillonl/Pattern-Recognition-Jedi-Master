function color=autocolor(index)
    % auto assign a color name for index
    colornames = ['k','r','g','b','y','m','c'];
    color = colornames(mod(index,length(colornames))+1);
end