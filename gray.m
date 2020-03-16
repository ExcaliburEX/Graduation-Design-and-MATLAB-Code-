% 验证GDP灰色预测模型精度，输出各参数值
clear
x0=[5202,5031,4899,4733,4679,4668,4642,4601];
n=length(x0);
lamda=x0(1:n-1)./x0(2:n)
range=minmax(lamda)
x1=cumsum(x0)
for i=2:n
z(i)=0.5*(x1(i)+x1(i-1));
end
B=[-z(2:n)',ones(n-1,1)];
Y=x0(2:n)';
u=B\Y
x=dsolve('Dx+a*x=b','x(0)=x0');
x=subs(x,{'a','b','x0'},{u(1),u(2),x1(1)});
yuce1=double(subs(x,'t',[0:n-1]));
yuce2=double(subs(x,'t',[0:n+1]));
digits(6),y=vpa(x) %为提高预测精度，先计算预测值，再显示微分方程的解
%yuce=[x0(1),diff(yuce1)]
yuce3=[x0(1),diff(yuce2)]
epsilon=x0-yuce %计算残差
delta=abs(epsilon./x0) %计算相对误差
rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda %计算级比偏差值