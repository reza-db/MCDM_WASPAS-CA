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

% Weight of respondents
W_C0 = Data1(:,1);
W_C1 = Data1(:,2);
W_C2 = Data1(:,3);
W_C3 = Data1(:,4);
W_C4 = Data1(:,5);
W_C5 = Data1(:,6);
W_C6 = Data1(:,7);
W_C7 = Data1(:,8);
W_C8 = Data1(:,9);
W_C9 = Data1(:,10);
W_C10 = Data1(:,11);
W_criteria = Data1(:,12);

% New Decision Attributes
save NewTableData.mat Data W_C0 W_C1 W_C2 W_C3 W_C4 W_C5 W_C6 W_C7 W_C8 W_C9 W_C10 W_criteria

TC = transpose(C); % transpose conditional attributes
Wcriteria = transpose(W_criteria); % transpose objective criteria
TW_C0 = transpose(W_C0);
TW_C1 = transpose(W_C1);
TW_C2 = transpose(W_C2);
TW_C3 = transpose(W_C3);
TW_C4 = transpose(W_C4);
TW_C5 = transpose(W_C5);
TW_C6 = transpose(W_C6);
TW_C7 = transpose(W_C7);
TW_C8 = transpose(W_C8);
TW_C9 = transpose(W_C9);
TW_C10 = transpose(W_C10);

%% Normalization
Xval=size(TC);
for i=1:Xval
for j= 1:length(TW_C0)
if Wcriteria(1,j)== 0
    Y(i,j)=min(TC(:,j))/TC(i,j);        
else
    Y(i,j)= (TC(i,j)-min(TC(:,j)))/(max(TC(:,j))-min(TC(:,j)));
end
end
end

%% lamda=0
for i=1:Xval
PWSM0(i,1)=sum(Y(i,:).*TW_C0);
PWPM0(i,1)=prod(Y(i,:).^TW_C0);
end

lamda0=0;
J0 =lamda0*PWSM0+(1-lamda0)*PWPM0; % Joint generalized criterion

%% lamda=0.1
for i=1:Xval
PWSM1(i,1)=sum(Y(i,:).*TW_C1);
PWPM1(i,1)=prod(Y(i,:).^TW_C1);
end

lamda1=0.1;
J1 =lamda1*PWSM1+(1-lamda1)*PWPM1; % Joint generalized criterion

%% lamda=0.2
for i=1:Xval
PWSM9(i,1)=sum(Y(i,:).*TW_C2);
PWPM9(i,1)=prod(Y(i,:).^TW_C2);
end

lamda9=0.2;
J9 =lamda9*PWSM9+(1-lamda9)*PWPM9; % Joint generalized criterion

%% lamda=0.3
for i=1:Xval
PWSM3(i,1)=sum(Y(i,:).*TW_C3);
PWPM3(i,1)=prod(Y(i,:).^TW_C3);
end

lamda3=0.3;
J3 =lamda3*PWSM3+(1-lamda3)*PWPM3; % Joint generalized criterion

%% lamda=0.4
for i=1:Xval
PWSM4(i,1)=sum(Y(i,:).*TW_C4);
PWPM4(i,1)=prod(Y(i,:).^TW_C4);
end

lamda4=0.4;
J4 =lamda4*PWSM4+(1-lamda4)*PWPM4; % Joint generalized criterion

%% lamda=0.5
for i=1:Xval
PWSM5(i,1)=sum(Y(i,:).*TW_C5);
PWPM5(i,1)=prod(Y(i,:).^TW_C5);
end

lamda5=0.5;
J5 =lamda5*PWSM5+(1-lamda5)*PWPM5; % Joint generalized criterion

%% lamda=0.6
for i=1:Xval
PWSM6(i,1)=sum(Y(i,:).*TW_C6);
PWPM6(i,1)=prod(Y(i,:).^TW_C6);
end

lamda6=0.6;
J6 =lamda6*PWSM6+(1-lamda6)*PWPM6; % Joint generalized criterion

%% lamda=0.7
for i=1:Xval
PWSM7(i,1)=sum(Y(i,:).*TW_C7);
PWPM7(i,1)=prod(Y(i,:).^TW_C7);
end

lamda7=0.7;
J7 =lamda7*PWSM7+(1-lamda7)*PWPM7; % Joint generalized criterion

%% lamda=0.8
for i=1:Xval
PWSM8(i,1)=sum(Y(i,:).*TW_C8);
PWPM8(i,1)=prod(Y(i,:).^TW_C8);
end

lamda8=0.8;
J8 =lamda8*PWSM8+(1-lamda8)*PWPM8; % Joint generalized criterion

%% lamda=0.9
for i=1:Xval
PWSM9(i,1)=sum(Y(i,:).*TW_C9);
PWPM9(i,1)=prod(Y(i,:).^TW_C9);
end

lamda9=0.9;
J9 =lamda9*PWSM9+(1-lamda9)*PWPM9; % Joint generalized criterion

%% lamda=1.0
for i=1:Xval
PWSM10(i,1)=sum(Y(i,:).*TW_C10);
PWPM10(i,1)=prod(Y(i,:).^TW_C10);
end

lamda10=1.0;
J10 =lamda10*PWSM10+(1-lamda10)*PWPM10; % Joint generalized criterion