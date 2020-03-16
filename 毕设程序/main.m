%% �������г������м���ͼ
%% ���ű�����
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
xlswrite('final_data.xlsx',alloc_info,1);%������յķ����Լ��迹��������
%% ��άʱ�շֲ�ͼ
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
        fprintf('��άʱ�շֲ�ͼ���� %2.2f%%  completed\n',(cnt/(N*90*120))*100);
     end
     cnt = cnt +1;
    end
end
end
set(gca,'FontSize',24,'Fontname', 'Times New Roman');
xlabel('�ϱ�����');
ylabel('��������');
zlabel('ʱ��');
set(get(gca,'XLabel'),'Fontsize',24,'Fontname', '����');
set(get(gca,'YLabel'),'Fontsize',24,'Fontname', '����');
set(get(gca,'ZLabel'),'Fontsize',24,'Fontname', '����');
fprintf('��ʼ����\n');
set(gca,'looseInset',[0 0 0 0]);
print(2,'-dpng','-r300','��άʱ�շֲ�ͼ');
toc

%% �����ܶ�ʱ��ͼ
tic
disp('�����ܶ�ʱ��ͼ����')
flow = zeros(1,N);
density = zeros(1,N);
for i = 1:N
    flow(i) = sum(JL{i,1}{1,2}(16,:))/120;
    density(i) = sum(JL{i,1}{1,1}(16,:))/120;
end
time = 1:N;
PlotGriddata(density',time',flow');
toc

