function C=knn(data,traindata,trainclass,k)
% K-Nearest-Neighbour classification
% data:         NxM matrix
% traindata:    NxM matrix
% trainclass:   Nx1 vector
% k:            int > 0

M = size(traindata,1); % traindata count
N = size(data,1); % data count

% calculate distances
dist = zeros(N,M);
for i=1:N
    for j=1:M
        dist(i,j) = norm(data(i,:)-traindata(j,:));
    end
end

% find k nearest neighbors
C = zeros(N,1);
for i=1:N
    [sd,ind] = sort(dist(i,:),'ascend');
    classes = zeros(k,1);
    for j=1:k
        classes(j) = trainclass(ind(j));
    end
    C(i) = mode(classes);
end

