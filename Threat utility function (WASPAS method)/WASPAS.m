Xval=length(X(:,1));
for i=1:Xval
for j= 1:length(W)
if Wcriteria(1,j)== 0
Y(i,j)=min(X(:,j))/X(i,j);
else
Y(i,j)=X(i,j)/max(X(:,j));
end
end
end
for i=1:Xval
PWSM(i,1)=sum(Y(i,:).*W);
PWPM(i,1)=prod(Y(i,:).^W);
end
lamda=0.5
J=lamda*PWSM+(1-lamda)*PWPM;
Joint_generalized_criterion = num2str([J])