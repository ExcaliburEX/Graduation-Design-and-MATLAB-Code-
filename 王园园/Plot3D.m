function  Plot3D(x,y,z)
mx=min(x);%��x����Сֵ
Mx=max(x);%��x�����ֵ
my=min(y);
My=max(y);
Nx=150; %����x���ֵ���ݵ���������ʵ�����ȷ��
Ny=150;%����y���ֵ���ݵ���������ʵ�����ȷ��
cx=linspace(mx,Mx,Nx);%��ԭʼx���ݵ����ֵ��Сֵ֮��ȼ������Nx����ֵ��
cy=linspace(my,My,Ny);%��ԭʼ����y�����ֵ��Сֵ֮��ȼ������Ny����ֵ��
cz=griddata(x,y,z,cx,cy','cubic');%����matlab��������������ֵ
figure;
set(gcf,'outerposition',get(0,'screensize'));
surfc(cx,cy,cz) %��������
set(gca,'FontSize',24,'Fontname', 'Times New Roman');
xlabel('������(����)');
ylabel('������(����)');
zlabel('�ܷ��ͷ���');
set(gca,'looseInset',[0 0 0 0]);
set(get(gca,'XLabel'),'Fontsize',20,'Fontname', '����');
set(get(gca,'YLabel'),'Fontsize',20,'Fontname', '����');
set(get(gca,'ZLabel'),'Fontsize',20,'Fontname', '����');
colorbar;
colormap(hsv);
print(1,'-dpng','-r300','ѡַ��άͼ');