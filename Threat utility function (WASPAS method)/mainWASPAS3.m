%% Main Program
%  run begine here
clc;
clear;
close all;

%% Let be an Information System (IS) = (U,A)
% Loading the original decision Table
load TableData.mat

% New Decision Table
Data1 = xlsread...
    ('Ranking (Weight according dependency degree).xlsx','Sheet7');

% Dependency degree for each reduction set
Dep_deg = Data1(:,4:18);
% Average of conditional risk attributes
Means_C = Data1(:,19);
% Significant degree of conditional risk attributes
Sig_C = Data1(:,20);
% Weight of conditional risk attributes
W_C = Data1(:,21);
W_criteria = Data1(:,23);

% New Decision Attributes
save NewTableData.mat Data Dep_deg Means_C Sig_C W_C

TW_C = transpose(W_C); % transpose weigth
Wcriteria = transpose(W_criteria);

Xval=size(C);
for i=1:Xval
for j= 1:length(TW_C)
if Wcriteria(1,j)== 0
    Y(i,j)= (C(i,j).*min(C(:,j)))/(max(C(:,j))-min(C(:,j)));            
else
    Y(i,j)= min(C(:,j))/C(i,j);   
end
end
end

for i=1:Xval
PWSM(i,1)=sum(Y(i,:).*TW_C);
PWPM(i,1)=prod(Y(i,:).^TW_C);
end

lamda=1;
J =lamda*PWSM+(1-lamda)*PWPM; % Joint generalized criterion
F1 = PWSM;
F2 = PWPM;