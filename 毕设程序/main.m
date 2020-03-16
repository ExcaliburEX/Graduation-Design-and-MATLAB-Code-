%% 运行所有程序运行及画图
%% 主脚本程序
clear;clc;

o = 0;
pa = [0.8,0.5,0.3];
T = [5,5];
N = 500;
vmax = 5;
k = [0.05,0.15];
draw = 1;

tic
[JL,JL_in,r,alloc_info]= CAtraffic(o,pa,T,N,vmax,k,draw);
toc
xlswrite('final_data.xlsx',alloc_info,1);%输出最终的分配以及阻抗延误数据
%% 二维时空分布图
str_data = ['k.';'b.';'c.';'g.';'m.';'r.';'y.'];
tic
figure(2);
cnt = 1;
set(gcf,'outerposition',get(0,'screensize'));
set(gca,'looseInset',[0 0 0 0]);
for i = 1 : N
    str = str_data(mod(ceil(10 * rand())+1,7)+1 );
for j = 1:90
    for k = 1 : 120
        if JL{i,1}{1,1}(j,k) > 0
            plot3(j,k,i,[str,'.']);
            hold on;
        end
     if ~mod(cnt,10000)
         clc;
        fprintf('二维时空分布图绘制 %2.2f%%  completed\n',(cnt/(N*90*120))*100);
     end
     cnt = cnt +1;
    end
end
end
set(gca,'FontSize',24,'Fontname', 'Times New Roman');
xlabel('南北方向');
ylabel('东西方向');
zlabel('时间');
set(get(gca,'XLabel'),'Fontsize',24,'Fontname', '宋体');
set(get(gca,'YLabel'),'Fontsize',24,'Fontname', '宋体');
set(get(gca,'ZLabel'),'Fontsize',24,'Fontname', '宋体');
fprintf('开始保存\n');
set(gca,'looseInset',[0 0 0 0]);
print(2,'-dpng','-r300','二维时空分布图');
toc

%% 流量密度时间图
tic
disp('流量密度时间图绘制')
flow = zeros(1,N);
density = zeros(1,N);
for i = 1:N
    flow(i) = sum(JL{i,1}{1,2}(16,:))/120;
    density(i) = sum(JL{i,1}{1,1}(16,:))/120;
end
time = 1:N;
PlotGriddata(density',time',flow');
toc

