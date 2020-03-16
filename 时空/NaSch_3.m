% ������ NaSch_3.m�������
% ����������ٶ� 3��Ԫ�����ڱ߽��������ټ����������
clf
clear all
%build the GUI
%define the plot button
plotbutton=uicontrol('style','pushbutton',...
'string','Run', ...
'fontsize',12, ...
'position',[100,400,50,20], ...
'callback', 'run=1;');
%define the stop button
erasebutton=uicontrol('style','pushbutton',...
'string','Stop', ...
'fontsize',12, ...
'position',[100,500,50,20], ...
'callback','freeze=1;');
%define the Quit button
quitbutton=uicontrol('style','pushbutton',...
'string','Quit', ...
'fontsize',12, ...
'position',[100,600,50,20], ...
'callback','stop=1;close;');
number = uicontrol('style','text', ...
'string','1', ...
'fontsize',12, ...
'position',[20,400,50,20]);
%CA setup
n=1000; %���ݳ�ʼ��
z=zeros(1,n); %Ԫ������
z=roadstart(z,200); %��·״̬��ʼ����·��������ֲ� 200 ��
cells=z;
vmax=5; %����ٶ�
v=speedstart(cells,vmax); %�ٶȳ�ʼ��
x=1; %��¼�ٶȺͳ���λ��
memor_cells=zeros(3600,n);
memor_v=zeros(3600,n);
imh=imshow(cells); %��ʼ��ͼ���ɫ�г�����ɫ��Ԫ��
set(imh, 'erasemode', 'none')
axis equal
axis tight
stop=0; %wait for a quit button push
run=0; %wait for a draw
freeze=0; %wait for a freeze�����ᣩ
while (stop==0 & x<11502)
if(run==1)
%�߽���������������ĩ�������ƽ�����ʹ�ÿ�������
a=searchleadcar(cells);
b=searchlastcar(cells);
%[cells,v]=border_control(cells,a,b,v,vmax);
i=searchleadcar(cells); %�����׳�λ��
for j=1:i
if i-j+1==n
[z,v]=leadcarupdate(z,v);
continue;
else
%====================================== ���١����١��������
if cells(i-j+1)==0; %�жϵ�ǰλ���Ƿ�ǿ�
continue;
else v(i-j+1)=min(v(i-j+1)+1,vmax); %����
%================================= ����
k=searchfrontcar((i-j+1),cells); %����ǰ���׸��ǿ�Ԫ��λ��
if k==0; %ȷ����ǰ��֮���Ԫ����
d=n-(i-j+1);
else d=k-(i-j+1)-1;
end
v(i-j+1)=min(v(i-j+1),d);
%==============================% ����
%�������
v(i-j+1)=randslow(v(i-j+1));
new_v=v(i-j+1);
%====================================== ���١����١��������
%���³���λ��
z(i-j+1)=0;
z(i-j+1+new_v)=1;
%�����ٶ�
v(i-j+1)=0;
v(i-j+1+new_v)=new_v;
end
end
end
cells=z;
memor_cells(x,:)=cells; %��¼�ٶȺͳ���λ��
memor_v(x,:)=v;
x=x+1;
set(imh,'cdata',cells) %����ͼ��
%update the step number diaplay
pause(0.0001);
stepnumber = 1+str2num(get(number,'string'));
set(number,'string',num2str(stepnumber))
end
if (freeze==1)
run = 0;
freeze = 0;
end
drawnow
end
%% NaSchʱ��ͼ
figure(1)
set(gcf,'outerposition',get(0,'screensize'));
for l=1:1:3600
for k=1:1:1000
if memor_cells(l,k)> 0
plot(k,l,'k.');
hold on;
end
end
end
xlabel('�ռ�λ�� ')
ylabel('ʱ�䣨s��')
set(gca,'FontSize',24,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',24,'Fontname', '����');
set(get(gca,'YLabel'),'Fontsize',24,'Fontname', '����');

set(gca,'looseInset',[0 0 0 0]);
print(1,'-dpng','-r300','NaSchʱ��ͼ');
%%  NaSch�ܶ�����ͼ
figure(2)
set(gcf,'outerposition',get(0,'screensize'));
for i=1:1:500
density(i)=sum(memor_cells(i,:)>0)/1000;
flow(i)=sum(memor_v(i,:))/1000;
end
h= plot(density,flow,'k.');
set(h,'MarkerSize',20);
%title('�����ܶ�ͼ ')
xlabel('�����ܶ�')
ylabel('�����ٶ�')
set(gca,'FontSize',24,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',24,'Fontname', '����');
set(get(gca,'YLabel'),'Fontsize',24,'Fontname', '����');
set(gca,'looseInset',[0 0 0 0]);
print(2,'-dpng','-r300','NaSch�ܶ�����ͼ');
