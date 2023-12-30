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
save NewTableData.mat Data1 Dep_deg Means_C Sig_C W_C W_criteria

% Declare number of risk attributes and parameters
nvars = 61;
TW_C = transpose(W_C); % transpose weigth
Wcriteria = transpose(W_criteria);
MaxGenerations_Data = 150;
MaxStallTime_Data = 100;
Aeq = [];
beq = [];

% Objective function
F = @obj_WASPAS;

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'MaxGenerations', MaxGenerations_Data);
options = optimoptions(options,'StallTest', 'geometricweighted');
options = optimoptions(options,'MaxStallTime', MaxStallTime_Data);
options = optimoptions(options,'Display', 'diagnose');
options = optimoptions(options,'PlotFcn', ...
    {@gaplotbestf @gaplotbestindiv @gaplotdistance @gaplotexpectation @gaplotrange @gaplotscorediversity @gaplotstopping });
[x,fval,exitflag,output,population,score] = ...
ga(F,nvars,[],[],Aeq,beq,[],[],[],[],options);
