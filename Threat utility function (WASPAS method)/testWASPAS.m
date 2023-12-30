
Xval=length(datasetresiko(:,1));
TW_C = transpose(W_C);
for i=1: Xval
    for j=1; length(dependencyvalue)
        if TW_C(1,j)==0
            Y(i,j)=min(datasetresiko(:,j))/datasetresiko(i,j);
        else
            Y(i,j)=datasetresiko(i,j)/max(datasetresiko(:,j));
        end
    end
end
for i=1: Xval
    PWSM(i,1)=sum(Y(i,:).*TW_C);
    PWPM(i,1)=prod(Y(i,:).^TW_C);
end

lamda = 0.5;
WASPAS= lamda*PWSM+(1-lamda)*PWPM;