clear; 
close all;

% ���� my_ga ���м���
% �������Ĳ�������         10
% �Զ�����Ӧ�Ⱥ�����         my_fitness
% ��Ⱥ��ģ                  100
% ÿһ���б��ֲ������Ŀ     50 (��������0.5)
% �������                  0.1 (1/10�ĸ��巢������)
% ����ݻ�����              10000 10000��
% ��СĿ��ֵ                1.0e-6 ������Ӧ�Ⱥ���ֵ < 0.000001����
[best_fitness, elite, generation, last_generation] = my_ga(10, 'my_fitness', 100, 50, 0.1, 10000, 1.0e-6);

% �����10��
% disp(best_fitness(9990:10000,:));
% disp(elite(9990:10000,:))
% �����ǲ����ʵģ���ΪGA�������м������ѭ����

% �������Ǻ��ʵ����
disp(last_generation); 
i_begin = last_generation - 9;
disp(best_fitness(i_begin:last_generation,:));
% ��eliteֵת��Ϊ���ⷶΧ��
my_elite = elite(i_begin:last_generation,:);
my_elite = 2 * (my_elite - 0.5);
disp(my_elite);

% �����Ӧ�ȵ��ݻ����
figure
loglog(1:generation, best_fitness(1:generation), 'linewidth',2)
xlabel('Generation','fontsize',15);
ylabel('Best Fitness','fontsize',15);
set(gca,'fontsize',15,'ticklength',get(gca,'ticklength')*2);

% ���Ž���ݻ����
figure
semilogx(1 : generation, 2 * elite(1 : generation, :) - 1)
xlabel('Generation','fontsize',15);
ylabel('Best Solution','fontsize',15);
set(gca,'fontsize',15,'ticklength',get(gca,'ticklength')*2);
