function C=pr_classify(testdata)
% data: Nx3 matrix
% returns: a class corresponding to
%	1=Slash left
%	2=Slash right
%	3=Cross strike
%	4=Parry & strike
%	5=Parry up
%	6=Overhead strike
%	7=Stab
%
% Usage:
%   Run 'setup' command before using this function.
%
load 'features.mat'

% normalize
testfeatures = extract_features(testdata);
for j=1:size(testfeatures,2)
    testfeatures(:,j)=(testfeatures(:,j)-normalization(1,j))/(normalization(2,j)-normalization(1,j));
end

% classify
C=knn(testfeatures,pr_feature,pr_class,1);
