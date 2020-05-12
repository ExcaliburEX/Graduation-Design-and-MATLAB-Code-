clear;clc;close all;

%% 生成随机OD矩阵
%od()

%%遗传参数设置
NUMPOP=200;%初始种群大小
irange_l=1; %问题解区间
irange_r=35; 
LENGTH=24; %二进制编码长度
ITERATION = 10000;%迭代次数
CROSSOVERRATE = 0.8;%杂交率
SELECTRATE = 0.4;%选择率
VARIATIONRATE = 0.2;%变异率
OD = xlsread('OD.xlsx');% 苏州地铁2号线调查问卷OD出行矩阵
h = xlsread('区间运行时间.xlsx'); % 苏州地铁2号线区间长度及运行时分

%初始化种群
pop=m_InitPop(NUMPOP,irange_l,irange_r);
pop_save=pop;
fitness_concat = [];
best_solution = [];
%开始迭代
for time=1:ITERATION
    %计算初始种群的适应度
    fitness=m_Fitness(pop, OD, h);
    fitness_concat = [fitness_concat;max(fitness)];
    pop_T = pop';
    [m,index] = max(m_Fitness(pop, OD, h));
   best_solution = [best_solution;pop(:,index)'];
    %选择
    pop=m_Select(fitness,pop,SELECTRATE);
    %编码
    binpop=m_Coding(pop,LENGTH,irange_l);
    %交叉
    kidsPop = crossover(binpop,NUMPOP,CROSSOVERRATE);
    %变异
    kidsPop = Variation(kidsPop,VARIATIONRATE);
    %解码
    kidsPop=m_Incoding(kidsPop,irange_l);
    %更新种群
    pop=[pop kidsPop];
end

disp(['最优解：' num2str(min(m_Fx(pop,OD))) '分钟']);
disp(['最优解对应的各参数：' num2str(pop(1,1)) ',' num2str(pop(2,1)) ',' num2str(pop(3,1)) ',' num2str(pop(4,1)) ]);
disp(['最大适应度：' num2str(max(m_Fitness(pop, OD, h)))]);   
    
figure
% set(gca,'looseInset',[0 0 0 0]);
set(gcf,'outerposition',get(0,'screensize'));
loglog(1:ITERATION, fitness_concat, 'Blue*-','linewidth',2)
legend('{\bf最优适应度值}');
xlabel('{\bf进化代数}','fontsize',30);
ylabel('{\bf最优适应度}','fontsize',30);
set(gca,'FontSize',20,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',20,'Fontname', '宋体');
set(get(gca,'YLabel'),'Fontsize',20,'Fontname', '宋体');
set(get(gca,'legend'),'Fontsize',20,'Fontname', '宋体');
set(get(gca,'title'),'Fontsize',20,'Fontname', '宋体');
set(gca,'linewidth',2); 
print(gcf,'-dpng','-r300','最优适应度值-进化代数');

figure
% set(gca,'looseInset',[0 0 0 0]);
set(gcf,'outerposition',get(0,'screensize'));
semilogx(1 : ITERATION, best_solution,'linewidth',4)
legend('{\bf大小交路折返站a}','{\bf大小交路折返站b}','{\bf大交路发车频率f_1}','{\bf小交路发车频率f_2}');
% text(6, 0.3, '$\leftarrow  y= 2^{-x}$', 'HorizontalAlignment', 'left', 'Interpreter', 'latex', 'FontSize', 15);
xlabel('{\bf进化代数}','fontsize',15);
ylabel('{\bf参数各代最优值}','fontsize',15);
set(gca,'FontSize',20,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',20,'Fontname', '宋体');
set(get(gca,'YLabel'),'Fontsize',20,'Fontname', '宋体');
set(get(gca,'legend'),'Fontsize',20,'Fontname', '宋体');
set(get(gca,'title'),'Fontsize',20,'Fontname', '宋体');
set(gca,'linewidth',2); 
print(gcf,'-dpng','-r300','参数各代最优值-进化代数');
    

