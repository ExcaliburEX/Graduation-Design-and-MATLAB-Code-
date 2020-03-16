% 主程序： NaSch_3.m程序代码
% 单车道最大速度 3个元胞开口边界条件加速减速随机慢化
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
n=1000; %数据初始化
z=zeros(1,n); %元胞个数
z=roadstart(z,200); %道路状态初始化，路段上随机分布 200 辆
cells=z;
vmax=5; %最大速度
v=speedstart(cells,vmax); %速度初始化
x=1; %记录速度和车辆位置
memor_cells=zeros(3600,n);
memor_v=zeros(3600,n);
imh=imshow(cells); %初始化图像白色有车，黑色空元胞
set(imh, 'erasemode', 'none')
axis equal
axis tight
stop=0; %wait for a quit button push
run=0; %wait for a draw
freeze=0; %wait for a freeze（冻结）
while (stop==0 & x<11502)
if(run==1)
%边界条件处理，搜素首末车，控制进出，使用开口条件
a=searchleadcar(cells);
b=searchlastcar(cells);
%[cells,v]=border_control(cells,a,b,v,vmax);
i=searchleadcar(cells); %搜索首车位置
for j=1:i
if i-j+1==n
[z,v]=leadcarupdate(z,v);
continue;
else
%====================================== 加速、减速、随机慢化
if cells(i-j+1)==0; %判断当前位置是否非空
continue;
else v(i-j+1)=min(v(i-j+1)+1,vmax); %加速
%================================= 减速
k=searchfrontcar((i-j+1),cells); %搜素前方首个非空元胞位置
if k==0; %确定于前车之间的元胞数
d=n-(i-j+1);
else d=k-(i-j+1)-1;
end
v(i-j+1)=min(v(i-j+1),d);
%==============================% 减速
%随机慢化
v(i-j+1)=randslow(v(i-j+1));
new_v=v(i-j+1);
%====================================== 加速、减速、随机慢化
%更新车辆位置
z(i-j+1)=0;
z(i-j+1+new_v)=1;
%更新速度
v(i-j+1)=0;
v(i-j+1+new_v)=new_v;
end
end
end
cells=z;
memor_cells(x,:)=cells; %记录速度和车辆位置
memor_v(x,:)=v;
x=x+1;
set(imh,'cdata',cells) %更新图像
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
%% NaSch时空图
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
xlabel('空间位置 ')
ylabel('时间（s）')
set(gca,'FontSize',24,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',24,'Fontname', '宋体');
set(get(gca,'YLabel'),'Fontsize',24,'Fontname', '宋体');

set(gca,'looseInset',[0 0 0 0]);
print(1,'-dpng','-r300','NaSch时空图');
%%  NaSch密度流量图
figure(2)
set(gcf,'outerposition',get(0,'screensize'));
for i=1:1:500
density(i)=sum(memor_cells(i,:)>0)/1000;
flow(i)=sum(memor_v(i,:))/1000;
end
h= plot(density,flow,'k.');
set(h,'MarkerSize',20);
%title('流量密度图 ')
xlabel('车流密度')
ylabel('车流速度')
set(gca,'FontSize',24,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',24,'Fontname', '宋体');
set(get(gca,'YLabel'),'Fontsize',24,'Fontname', '宋体');
set(gca,'looseInset',[0 0 0 0]);
print(2,'-dpng','-r300','NaSch密度流量图');
