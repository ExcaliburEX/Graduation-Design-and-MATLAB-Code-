clc
clear
X=[40.4 23.1 33.6 43.2;
    2.45 8.56 5.67 10.03;
    20 70 93 120;
    2500 2000 2500 4000];
Y=[2 3 3 2;
    0.76 0.68 0.83 0.89;
    650 850 800 700];
%%此前为数据的处理，只需按列输入每个程序的X和Y指标集数据即可，无需改动程序。
%%

A1=[X;Y];
[m,~]=size(X);
[s,~]=size(Y);
[~,n]=size(A1);
A2=blkdiag(eye(m),-eye(s));
i=1;
%修改此处的i分别等于1至n，即可获得不同目标的threta值。
A3=[-X(:,i);zeros(s,1)];
A=[A1 A2 A3];
B=[zeros(m,1);Y(:,i)];
lb=zeros(n+m+s+1,1);
x=linprog([zeros(1,n+m+s) 1],A,B,[],[],lb,[]);
theta=x(n+m+s+1)
lambda=x(1:n)
s_=x(n+1:m+n)
s_plus=x(m+n+1:m+n+s-1)
