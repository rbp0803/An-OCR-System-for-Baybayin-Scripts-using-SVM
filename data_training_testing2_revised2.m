%============================================================  %
%Note:                                                         % 
%We use this function to generate binary SVM models for Script %  
%classification, Baybayin diacritics categorization, and       %
%binary classifiers for confusive Baybayin characters          %
%------------------------------------------------------------  %

%load 2 datasets
% houldout $\in$ (0,1) = Randomly select and reserve p*100% of the data as 
%                      validation data, and train the model using the rest of the data.
% s = number of runs
%k = misclassfication rate in ith iteration
%mean_k = mean of k
% label = predicted label at the last iteration
% y1 = true label at the last iteration
function [k, mean_k, label_cell, y1_cell,SVMModels,crossval_SVM]=data_training_testing2_revised2(data_traintest1,data_traintest2, holdout,s)
rng('shuffle')



[row1, col1]=size(data_traintest1);
[row2, col2]=size(data_traintest2);
data1=zeros(row1,col1);
data2=zeros(row2,col2);

k=zeros(s,1);
kFoldLoss=zeros(s,1);

SVMModels=cell(s,1);
crossval_SVM=cell(s,1);
label_cell=cell(s,1);
y1_cell=cell(s,1);
for j=1:s


for i=1:row1
    data1(i,:)=data_traintest1(i,:);
end

for i=1:row2
    data2(i,:)=data_traintest2(i,:);
end

data0=single([data1;data2]);
[row3, col3]=size(data0);

P=randperm(row3);

DATA_Train=zeros(row3,col3);
DATA_Train=data0(P(:),:);

y=zeros(row3,1);

for i=1:row3 
if P(i)> row1
    y(i)=1;
else
    y(i)=-1;
end
end
   
tic; cl2= fitcsvm(DATA_Train,y,'Kernelfunction','rbf',...
'Standardize',true,'KernelScale','auto','BoxConstraint',Inf,'Holdout',holdout); toc;
tic;
SVMModels{j}=cl2;
%see-ell


Trained_cl=cl2.Trained{1};
crossval_SVM{j}=Trained_cl;



Test_cl=test(cl2.Partition);
Xtest=DATA_Train(Test_cl,:);
y1=y(Test_cl,:);

y1_cell{j}=y1;


[label,score]=predict(Trained_cl,Xtest);

label_cell{j}=label;

mis =label~=y1;
mis_rate=sum(mis)/length(y1);
k(j)=mis_rate;
toc;
end
mean_k=mean(k);

end
