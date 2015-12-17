clc
clear all
close all
setup

% plotclass(data,1,3)
% plotclass(data,2,3)
% plotclass(data,3,3)
% plotclass(data,5,3)
% plotclass(data,4,3)
% plotclass(data,6,3)
% plotclass(data,7,3)

% compare classification results to correct classes
C(:,1) = class;
C(:,end+1) = classify(feature,feature,class); % baseline: matlab's own implementation
C(:,end+1) = knn(feature,feature,class,1);
C(:,end+1) = knn(feature,feature,class,3);
C(:,end+1) = knn(feature,feature,class,5);

for i=2:size(C,2)
    fprintf('Classified correctly: ');successrate(C(:,1),C(:,i));
end

disp('-- 50/50 test/train:');

testdata = feature(1:2:end,:);
traindata = feature(2:2:end,:);
trainclass = class(2:2:end,:);
C2(:,1) = class(1:2:end,:);
C2(:,end+1) = classify(testdata,traindata,trainclass);
C2(:,end+1) = knn(testdata,traindata,trainclass,1);
C2(:,end+1) = knn(testdata,traindata,trainclass,3);
C2(:,end+1) = knn(testdata,traindata,trainclass,5);
for i=2:size(C2,2)
    fprintf('Classified correctly: ');successrate(C2(:,1),C2(:,i));
end


% disp('-- N subsets test/train:');
% 
% N=4;
% subdata = {};
% for i=1:N
%     sd = feature(i:N:end,:);
%     sc = class(i:N:end,:);
%     s = struct('data', sd, 'class', sc);
%     subdata{length(subdata)+1} = s;
% end
% 
% C3 = {};
% for i=1:N
%     for j=1:N
%         s = struct(...
%             'C',knn(subdata{i}.data,subdata{j}.data,subdata{j}.class,1),...
%             'class',subdata{i}.class);
%         C3{length(C3)+1} = s;
%     end
% end
% 
% for i=1:length(C3)
%     fprintf('Classified correctly: ');successrate(C3{i}.class,C3{i}.C);
% end


disp('-- leave-one-out:');
S = [];
N=1;
K=100;

for k=1:K
    sampleind = [];
    for i=1:N
        sampleind(i) = round(rand(1)*length(feature));
    end

    testdata=[];
    testclass=[];
    traindata=[];
    trainclass=[];
    for i=1:length(feature)
        if any(sampleind==i)
            testdata(end+1,:)=feature(i,:);
            testclass(end+1)=class(i);
        else
            traindata(end+1,:)=feature(i,:);
            trainclass(end+1)=class(i);
        end
    end


    C4 = [];
    C4(:,1) = testclass;
    C4(:,end+1) = classify(testdata,traindata,trainclass);
    C4(:,end+1) = knn(testdata,traindata,trainclass,1);
    C4(:,end+1) = knn(testdata,traindata,trainclass,3);
    C4(:,end+1) = knn(testdata,traindata,trainclass,5);
    C4(:,end+1) = knn(testdata,traindata,trainclass,9);

    for i=1:size(C4,2)
        S(k,i) = successrateval(C4(:,1),C4(:,i));
%         if i~=1
%             fprintf('Classified correctly: ');successrate(C4(:,1),C4(:,i));
%         end
    end

end

for i=1:size(S,2)
    fprintf('K=%d N=%d case=%d classified correctly: %3.2d%%\n', K, N, i, round(mean(S(:,i))*100));
end


% test pr_classify()
total = 0;
error = 0;
for i=1:length(data)
    total = total + 1;
    C = pr_classify(data{i}.data);
    %fprintf('%d\n',C);
    if C ~= data{i}.class
        error = error + 1;
    end
end
fprintf('pr_classify() errors: %d%%\n',round((error/total)*100));



