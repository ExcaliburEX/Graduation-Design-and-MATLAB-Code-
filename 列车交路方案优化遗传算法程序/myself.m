clear;clc;close all;

%% �������OD����
%od()

%%�Ŵ���������
NUMPOP=200;%��ʼ��Ⱥ��С
irange_l=1; %���������
irange_r=35; 
LENGTH=24; %�����Ʊ��볤��
ITERATION = 10000;%��������
CROSSOVERRATE = 0.8;%�ӽ���
SELECTRATE = 0.4;%ѡ����
VARIATIONRATE = 0.2;%������
OD = xlsread('OD.xlsx');% ���ݵ���2���ߵ����ʾ�OD���о���
h = xlsread('��������ʱ��.xlsx'); % ���ݵ���2�������䳤�ȼ�����ʱ��

%��ʼ����Ⱥ
pop=m_InitPop(NUMPOP,irange_l,irange_r);
pop_save=pop;
fitness_concat = [];
best_solution = [];
%��ʼ����
for time=1:ITERATION
    %�����ʼ��Ⱥ����Ӧ��
    fitness=m_Fitness(pop, OD, h);
    fitness_concat = [fitness_concat;max(fitness)];
    pop_T = pop';
    [m,index] = max(m_Fitness(pop, OD, h));
   best_solution = [best_solution;pop(:,index)'];
    %ѡ��
    pop=m_Select(fitness,pop,SELECTRATE);
    %����
    binpop=m_Coding(pop,LENGTH,irange_l);
    %����
    kidsPop = crossover(binpop,NUMPOP,CROSSOVERRATE);
    %����
    kidsPop = Variation(kidsPop,VARIATIONRATE);
    %����
    kidsPop=m_Incoding(kidsPop,irange_l);
    %������Ⱥ
    pop=[pop kidsPop];
end

disp(['���Ž⣺' num2str(min(m_Fx(pop,OD))) '����']);
disp(['���Ž��Ӧ�ĸ�������' num2str(pop(1,1)) ',' num2str(pop(2,1)) ',' num2str(pop(3,1)) ',' num2str(pop(4,1)) ]);
disp(['�����Ӧ�ȣ�' num2str(max(m_Fitness(pop, OD, h)))]);   
    
figure
% set(gca,'looseInset',[0 0 0 0]);
set(gcf,'outerposition',get(0,'screensize'));
loglog(1:ITERATION, fitness_concat, 'Blue*-','linewidth',2)
legend('{\bf������Ӧ��ֵ}');
xlabel('{\bf��������}','fontsize',30);
ylabel('{\bf������Ӧ��}','fontsize',30);
set(gca,'FontSize',20,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',20,'Fontname', '����');
set(get(gca,'YLabel'),'Fontsize',20,'Fontname', '����');
set(get(gca,'legend'),'Fontsize',20,'Fontname', '����');
set(get(gca,'title'),'Fontsize',20,'Fontname', '����');
set(gca,'linewidth',2); 
print(gcf,'-dpng','-r300','������Ӧ��ֵ-��������');

figure
% set(gca,'looseInset',[0 0 0 0]);
set(gcf,'outerposition',get(0,'screensize'));
semilogx(1 : ITERATION, best_solution,'linewidth',4)
legend('{\bf��С��·�۷�վa}','{\bf��С��·�۷�վb}','{\bf��·����Ƶ��f_1}','{\bfС��·����Ƶ��f_2}');
% text(6, 0.3, '$\leftarrow  y= 2^{-x}$', 'HorizontalAlignment', 'left', 'Interpreter', 'latex', 'FontSize', 15);
xlabel('{\bf��������}','fontsize',15);
ylabel('{\bf������������ֵ}','fontsize',15);
set(gca,'FontSize',20,'Fontname', 'Times New Roman');
set(get(gca,'XLabel'),'Fontsize',20,'Fontname', '����');
set(get(gca,'YLabel'),'Fontsize',20,'Fontname', '����');
set(get(gca,'legend'),'Fontsize',20,'Fontname', '����');
set(get(gca,'title'),'Fontsize',20,'Fontname', '����');
set(gca,'linewidth',2); 
print(gcf,'-dpng','-r300','������������ֵ-��������');
    

