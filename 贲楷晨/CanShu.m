% 验证GDP灰色预测模型精度，输出各参数值
clear
x = xlsread('data.xlsx');
for j = 1:size(x,2)
    x = xlsread('data.xlsx');
    x0=x(:,j)';
    n=length(x0);
    lamda=x0(1:n-1)./x0(2:n) ;
    xlswrite('result.xlsx',{'lamda'},j,'A1');
    xlswrite('result.xlsx',lamda(:),j,'A2');
    range=minmax(lamda);
    xlswrite('result.xlsx',{'range'},j,'B1');
    xlswrite('result.xlsx',range(:),j,'B2');
    x1=cumsum(x0);
    xlswrite('result.xlsx',{'x1'},j,'C1');
    xlswrite('result.xlsx',x1(:),j,'C2');
    for i=2:n
        z(i)=0.5*(x1(i)+x1(i-1));
    end
    B=[-z(2:n)',ones(n-1,1)];
    Y=x0(2:n)';
    u=B\Y;
    xlswrite('result.xlsx',{'u'},j,'D1');
    xlswrite('result.xlsx',u(:),j,'D2');
    x=dsolve('Dx+a*x=b','x(0)=x0');
    x=subs(x,{'a','b','x0'},{u(1),u(2),x1(1)});
    yuce1=double(subs(x,'t',[0:n-1]));
    digits(6),y=vpa(x); %为提高预测精度，先计算预测值，再显示微分方程的解
    yuce=[x0(1),diff(yuce1)];
    xlswrite('result.xlsx',{'yuce'},j,'E1');
    xlswrite('result.xlsx',yuce(:),j,'E2');
    epsilon=x0-yuce; %计算残差
    xlswrite('result.xlsx',{'epsilon'},j,'F1');
    xlswrite('result.xlsx', epsilon(:),j,'F2');
    delta=abs(epsilon./x0); %计算相对误差
    xlswrite('result.xlsx',{'delta'},j,'G1');
    xlswrite('result.xlsx', delta(:),j,'G2');
    rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda; %计算级比偏差值
    xlswrite('result.xlsx',{'rho'},j,'H1');
    xlswrite('result.xlsx', rho(:),j,'H2');
    clear
end