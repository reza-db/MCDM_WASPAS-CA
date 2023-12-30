%% Main Program
%  run begine here
clc;
clear;
close all;

%% Let be an Information System (IS) = (U,A)
% Loading the original decision Table
load TableData.mat

% New Decision Table
Data2 = xlsread...
    ('Ranking (Weight according dependency degree).xlsx','Sheet8');

% Dependency degree for each reduction set
Dep_deg = Data2(:,4:18);
% Average of conditional risk attributes
Means_C = Data2(:,19);
% Significant degree of conditional risk attributes
Sig_C = Data2(:,20);
% Weight of conditional risk attributes
W_Cmin = Data2(:,23);
W_Cmoderate = Data2(:,24);
W_criteria = Data2(:,25);

% New Decision Attributes
save NewTableData.mat Data Dep_deg Means_C Sig_C W_Cmin W_Cmoderate

TW_Cmin = transpose(W_Cmin); % transpose weigth
TW_Cmoderate = transpose(W_Cmoderate);
Wcriteria = transpose(W_criteria);
TC = transpose(C);

Xval=size(TC);
for i=1:Xval
for j= 1:length(TW_Cmin)
if Wcriteria(1,j)== 0
    Y(i,j)=min(TC(:,j))/TC(i,j);        
else
    Y(i,j)=TC(i,j)/max(TC(:,j));        
end
end
end

for i=1:Xval
PWSM(i,1)=sum(Y(i,:).*TW_Cmin);
PWPM(i,1)=prod(Y(i,:).^TW_Cmin);
end

lamda=1;
J =lamda*PWSM+(1-lamda)*PWPM; % Joint generalized criterion
F1 = PWSM;
F2 = PWPM;