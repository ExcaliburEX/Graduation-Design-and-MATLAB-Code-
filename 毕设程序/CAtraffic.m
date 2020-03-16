function [JL,JL_in,r,alloc_info]=CAtraffic(o,pa,T,N,vmax,k,draw)
%输入：
%       o，是否开放小区，1是，0否。
%       pa，概率设置:
%               pa(1)，入车概率。
%               pa(2)，转弯概率。
%               pa(3)，初始有车率。
%       T，信号灯周期:
%               T(1)，东西通行时长。
%               T(2)，南北通行时长。
%       N，迭代次数。
%       vmax，最大速度。
%       k，慢化系数:
%               k(1)，当前车速对慢化概率的影响。
%               k(2)，前后两格内车辆数对慢化概率的影响。
%       draw，可视化控制，1开启可视化，0关闭可视化。
%输出：
%       JL，每时刻元胞状态记录。
%       JL_in，车辆进入系统情况记录:
%               JL_in(:,1)为实际进入车辆。
%               JL_in(:,2)为本该进入车辆。
%       r，路口（包括有红绿灯和无红绿灯的）趋于占总可通行区域的比值。
global e_1 e_2 e_3;
p=pa(1);%入车概率
p_turn=pa(2);%转弯概率
p_ini_car=pa(3);%初始有车率

[m,m_in,r]=m_ini(o);
s=s_ini(m,p_ini_car,vmax);

JL=cell(N,1);
JL_in=zeros(N,2);
alloc_info = [];
for i=1:N
    [s,JL_in(i,:)]= carin(s,m,m_in,p,vmax);
    s=rand_slow(s,k);
    s=goforward(s,m,i,T,p_turn,vmax);
    if draw==1
        imagesc(s{1});
        set(gca,'FontSize',20,'Fontname', 'Times New Roman');
        drawnow
    end
    JL{i}=s;
    
    e_1 = sum(sum(JL{i,1}{1,1}(1:36,15:16))) * 100;
    e_2 = sum(sum(JL{i,1}{1,1}(35:36,1:46))) * 100;
    e_3 = sum(sum(JL{i,1}{1,1}(36:75,15:16))) * 100;
    if rem(i,10) == 0
        chromosome = nsga_2_optimization(i/10);
        index = randi(size(chromosome,1),1,1);
        for j = 1:9
            if j >= 1 && j <= 3
                alloc_info(i/10,j) = chromosome(index,j);
            elseif j== 4
                alloc_info(i/10,j) = left_road(chromosome(i/10,j-3),1);
            elseif j == 5
                alloc_info(i/10,j) = stright_road(chromosome(i/10,j-3),1);
            elseif j == 6
                alloc_info(i/10,j) = right_road(chromosome(i/10,j-3),1);
            elseif j == 7
                alloc_info(i/10,j) = left_road(chromosome(i/10,j-6),2);
            elseif j == 8
                alloc_info(i/10,j) = stright_road(chromosome(i/10,j-6),2);
            elseif j == 9
                alloc_info(i/10,j) = right_road(chromosome(i/10,j-6),2);
            end
        end
    end
end
