n=10;m=6;
y=[75 64 80 89 83 108 71 121 108 72];
x1=[46 34 50 44 31 71 38 39 37 23];
x2=[73 65 72 48 46 104 73 60 50 37];
x3=[5 7 9 3 3 7 7 4 3 3];
x4=[0.903 0.768 0.768 0.787 0.745 1.07 0.835 0.713 0.661 0.571];
x5=[49 39 31 24 26 60 46 27 27 26];
x6=[44 48 70 135 133 37 40 179 159 118];
X=[ones(n,1),x1',x2',x3',x4',x5',x6'];
[b,bint,r,rint,s]=regress(y',X);
s2=sum(r.^2)/(n-m-1);
b,bint,s,s2
rcoplot(r,rint)

data = xlsread('x1-x6未来10年预测值.xlsx')
X1 = ones(length(data),1)
for i = 1:m
   X1 = [X1,[X(:,i+1);data(n+1:end,i)]]
end
t_true = 1:length(y);
t_estimate = 1:length(data);
y_estimate = X1(t_estimate, :)*b
figure(1);
plot(t_true, y,'ro'); 
hold on;
plot(t_estimate,y_estimate, 'g-');
xlabel('年份');
unit = '万吨';
ylabel(unit);
%set(gca,'looseInset',[0 0 0 0]);
txt1 = '实际值';
txt2 = '预测值';
legend(txt1,txt2);
set(gca,'FontSize',12,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',12,'Fontname', '宋体');
set(get(gca,'YLabel'),'Fontsize',12,'Fontname', '宋体');
set(get(gca,'legend'),'Fontsize',12,'Fontname', '宋体');
set(get(gca,'title'),'Fontsize',12,'Fontname', '宋体');
print(gcf,'-djpeg','-r300','图');




