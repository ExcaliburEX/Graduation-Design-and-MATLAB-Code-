function  PlotGriddata(x,y,z)
mx=min(x);%求x的最小值
Mx=max(x);%求x的最大值
my=min(y);
My=max(y);
Nx=100; %定义x轴插值数据点数，根据实际情况确定
Ny=100;%定义y轴插值数据点数，根据实际情况确定
cx=linspace(mx,Mx,Nx);%在原始x数据的最大值最小值之间等间隔生成Nx个插值点
cy=linspace(my,My,Ny);%在原始数据y的最大值最小值之间等间隔生成Ny个插值点
cz=griddata(x,y,z,cx,cy','cubic');%调用matlab函数进行立方插值
figure;
set(gcf,'outerposition',get(0,'screensize'));
surfc(cx,cy,cz) %绘制曲面
set(gca,'FontSize',24,'Fontname', 'Times New Roman');
xlabel('车流密度');
ylabel('时间');
zlabel('车流速度');
set(gca,'looseInset',[0 0 0 0]);
set(get(gca,'XLabel'),'Fontsize',20,'Fontname', '宋体');
set(get(gca,'YLabel'),'Fontsize',20,'Fontname', '宋体');
set(get(gca,'ZLabel'),'Fontsize',20,'Fontname', '宋体');
colorbar;
colormap(jet);
print(1,'-dpng','-r300','时间流量密度三维图');