clear ;clc;
X=[5 6 6;
    7 9 10;
    33 48 31];
Y=[0.64 0.85 0.7;
1.45 1.53 1.9];
n=size(X',1);m=size(X,1);s=size(Y,1);
epsilon=10^(-10);
f=[zeros(1,n) -epsilon*ones(1,m+s) 1];
A=zeros(1,m+n+s+1);b=0;
LB=zeros(n+m+1,1);UB=[];
LB(n+m+s+1)=-Inf;
for i=1:n;
    Aeq=[X eye(m) zeros(m,s) -X(:,i)
        Y zeros(s,m) -eye(s) zeros(s,1)];
    beq=[zeros(m,1)
        Y(:,1)];
    w(:,i)=linprog(f,A,b,Aeq,beq,LB,UB);
end
w
lambda=w(1:n,:)            %输出lambuda
s_minus=w(n+1:m+n,:)       %输出s+
s_plus=w(n+m+1:n+m+s,:)    %输出s-
theta=w(n+m++s+1,:)        %输出sita