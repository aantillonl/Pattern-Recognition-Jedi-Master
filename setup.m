[folder, name, ext] = fileparts(which(mfilename));
addpath(fullfile(folder,'data'));

% load all the data files from the data directory
data = load_data('data','-ascii');

% extract features and fill the data structure
for i=1:length(data)
    data{i}.features = extract_features(data{i}.data);
end

% get plain feature and class lists from the data structure
[feature,class] = convert2lists(data);

normalization = [];

% normalize using min-max scaling
for i=1:size(feature,2)
    normalization(:,i) = [min(feature(:,i)) max(feature(:,i))];
    feature(:,i) = minmaxscale(feature(:,i));
end

pr_feature = feature;
pr_class = class;

save('features.mat')