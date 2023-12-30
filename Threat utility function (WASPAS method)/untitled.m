function [x,fval,exitflag,output,population,score] = untitled(nvars,Aeq,beq,MaxGenerations_Data,MaxStallTime_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'MaxGenerations', MaxGenerations_Data);
options = optimoptions(options,'StallTest', 'geometricweighted');
options = optimoptions(options,'MaxStallTime', MaxStallTime_Data);
options = optimoptions(options,'Display', 'diagnose');
options = optimoptions(options,'PlotFcn', {  @gaplotbestf @gaplotbestindiv @gaplotdistance @gaplotexpectation @gaplotrange @gaplotscorediversity @gaplotstopping });
[x,fval,exitflag,output,population,score] = ...
ga(@multiobj_WSP,nvars,[],[],Aeq,beq,[],[],[],[],options);
