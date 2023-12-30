%% Main Program
%  run begine here
clc;
clear;
close all;

%% Let be an Information System (IS) = (U,A)
% Raw data MSI
Data = xlsread...
    ('Ranking (Weight according dependency degree).xlsx','RawData_MSI');

% Conditional risk features
C = (Data(:,2:62));
save TableDataC_Risk.mat C

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
save NewTableData.mat Dep_deg Means_C Sig_C W_C W_criteria

TW_C = transpose(W_C); % transpose weigth
Wcriteria = transpose(W_criteria);

Xval=size(C);
for i=1:Xval
for j= 1:length(TW_C)
if Wcriteria(1,j)== 0
    Y(i,j)=min(C(:,j))/C(i,j);        
else
    Y(i,j)=C(i,j)/max(C(:,j));        
end
end
end

for i=1:Xval
PWSM(i,1)=sum(Y(i,:).*TW_C);
PWPM(i,1)=prod(Y(i,:).^TW_C);
end

F1 = PWSM;
F2 = PWPM;

lamda1=0;
lamda2=0.1;
lamda3=0.2;
lamda4=0.3;
lamda5=0.4;
lamda6=0.5;
lamda7=0.6;
lamda8=0.7;
lamda9=0.8;
lamda10=0.9;
lamda11=1;

J1 =lamda1*PWSM+(1-lamda1)*PWPM; % Joint generalized criterion lamda 0
J2 =lamda2*PWSM+(1-lamda2)*PWPM; % Joint generalized criterion lamda 0.1
J3 =lamda3*PWSM+(1-lamda3)*PWPM; % Joint generalized criterion lamda 0.2
J4 =lamda4*PWSM+(1-lamda4)*PWPM; % Joint generalized criterion lamda 0.3
J5 =lamda5*PWSM+(1-lamda5)*PWPM; % Joint generalized criterion lamda 0.4
J6 =lamda6*PWSM+(1-lamda6)*PWPM; % Joint generalized criterion lamda 0.5
J7 =lamda7*PWSM+(1-lamda7)*PWPM; % Joint generalized criterion lamda 0.6
J8 =lamda8*PWSM+(1-lamda8)*PWPM; % Joint generalized criterion lamda 0.7
J9 =lamda9*PWSM+(1-lamda9)*PWPM; % Joint generalized criterion lamda 0.8
J10 =lamda10*PWSM+(1-lamda10)*PWPM; % Joint generalized criterion lamda 0.9
J11 =lamda11*PWSM+(1-lamda11)*PWPM; % Joint generalized criterion lamda 1

% Generating plot
