function X = zeroshift(X,k)
[m,n]=size(X);
X = circshift(X,k);
if k(1)>0
    X(1:k(1),:)=0;
elseif k(1)<0
    X(m+k(1)+1:m,:)=0;
end
if k(2)>0
    X(:,1:k(2))=0;
elseif k(2)<0
    X(:,n+k(2)+1:n)=0;
end
end

