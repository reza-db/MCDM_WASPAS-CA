function [F1,F2] = obj_WSM(C)
% TargetOptFcn Objective function using GA approach
% Input:  Name        Description                   Type
%          C          Conditional Att.              array
% Output: Name        Description                   Tpye
%         PWSM        Preferences Score of WSM      double
%         PWPM        Preferences Score of WPM      double

% Author: reza_dano 
% Email:  dobagusmuhammadreza@gmail.com
% Time:   2021/11/10
%==========================================================================

Xval= C(1);
TW_C= C(2);
Wcriteria = C(3);

Xval=length(C(:,1));
for i=1:Xval
for j= 1:length(TW_C)
if Wcriteria(1,j)== 1
Y(i,j)=C(i,j)/max(C(:,j));
else
Y(i,j)=min(C(:,j))/C(i,j);
end
end
end

for i=1:Xval
PWSM(i,1)=sum(Y(i,:).*TW_C);
PWPM(i,1)=prod(Y(i,:).^TW_C);
end

F1 = PWSM;
F2 = PWPM;
end

