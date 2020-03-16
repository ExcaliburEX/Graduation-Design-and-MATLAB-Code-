A=xlsread('xinjie.xlsx','sheet1');
%根据自己数据存储的路径更改
%第一列y，第二列x1
n=length(A);
y=A(:,1);
x1=A(:,2);
X=[ones(n,1),x1];
[b,bint,r,rint,stats]=regress(y,X);
figure;
set(gcf,'visible','off');
set(gcf,'outerposition',get(0,'screensize'));
plot(x1,y,'rp');
rcoplot(r,rint);
title('\fontname{宋体}残差图绘制');
xlabel('数据');ylabel('残差');
set(gca,'FontSize',30,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',30,'Fontname', '宋体');
set(get(gca,'YLabel'),'Fontsize',30,'Fontname', '宋体');
z=b(1)+b(2)*x1;
print(gcf,'-dpng','-r300','残差图绘制');
figure;
set(gcf,'visible','off');
set(gcf,'outerposition',get(0,'screensize'));
plot(x1,y,'rp',x1,z,'b');
title('\fontname{宋体}散点图及其回归线');
set(gca,'FontSize',30,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',30,'Fontname', '宋体');
set(get(gca,'YLabel'),'Fontsize',30,'Fontname', '宋体');
print(gcf,'-dpng','-r300','散点图及其回归线');
b