function [features,classes]=convert2lists(data)
    % Iterate data structs and get the features and classes as separate
    % lists.
    % data: cell array of structs
    classes = zeros(length(data),1);
    features = zeros(length(data),length(data{1}.features));
    for i=1:length(data)
        features(i,:) = data{i}.features;
        classes(i) = data{i}.class;
    end