A=xlsread('xinjie.xlsx','sheet1');
%�����Լ����ݴ洢��·������
%��һ��y���ڶ���x1
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
title('\fontname{����}�в�ͼ����');
xlabel('����');ylabel('�в�');
set(gca,'FontSize',30,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',30,'Fontname', '����');
set(get(gca,'YLabel'),'Fontsize',30,'Fontname', '����');
z=b(1)+b(2)*x1;
print(gcf,'-dpng','-r300','�в�ͼ����');
figure;
set(gcf,'visible','off');
set(gcf,'outerposition',get(0,'screensize'));
plot(x1,y,'rp',x1,z,'b');
title('\fontname{����}ɢ��ͼ����ع���');
set(gca,'FontSize',30,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',30,'Fontname', '����');
set(get(gca,'YLabel'),'Fontsize',30,'Fontname', '����');
print(gcf,'-dpng','-r300','ɢ��ͼ����ع���');
b