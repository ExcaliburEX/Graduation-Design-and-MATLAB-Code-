function [best_fitness, elite, generation, last_generation] = my_ga( ...
    number_of_variables, ...    % �������Ĳ�������
    fitness_function, ...       % �Զ�����Ӧ�Ⱥ�����
    population_size, ...        % ��Ⱥ��ģ��ÿһ��������Ŀ��
    parent_number, ...          % ÿһ���б��ֲ������Ŀ�����˱��죩
    mutation_rate, ...          % �������
    maximal_generation, ...     % ����ݻ�����
    minimal_cost ...            % ��СĿ��ֵ������ֵԽС������Ӧ��Խ�ߣ�
)

% �ۼӸ���
% ���� parent_number = 10
% ���� parent_number:-1:1 ��������һ������
% ��ĸ sum(parent_number:-1:1) ��һ����ͽ����һ������
%
% ���� 10     9     8     7     6     5     4     3     2     1
% ��ĸ 55
% ��� 0.1818    0.1636    0.1455    0.1273    0.1091    0.0909    0.0727    0.0545    0.0364    0.0182
% �ۼ� 0.1818    0.3455    0.4909    0.6182    0.7273    0.8182    0.8909    0.9455    0.9818    1.0000
%
% ���������Կ���
% �ۼӸ��ʺ�����һ����0��1������Խ��Խ���ĺ���
% ��Ϊ����ӵĸ���Խ��ԽС�������ǽ������еģ�
cumulative_probabilities = cumsum((parent_number:-1:1) / sum(parent_number:-1:1)); % 1������Ϊparent_number������

% �����Ӧ��
% ÿһ���������Ӧ�ȶ��ȳ�ʼ��Ϊ1
best_fitness = ones(maximal_generation, 1);

% ��Ӣ
% ÿһ���ľ�Ӣ�Ĳ���ֵ���ȳ�ʼ��Ϊ0
elite = zeros(maximal_generation, number_of_variables);

% ��Ů����
% ��Ⱥ���� - ��ĸ��������ĸ��ÿһ���в������ı�ĸ��壩
child_number = population_size - parent_number; % ÿһ����Ů����Ŀ

% ��ʼ����Ⱥ
% population_size ��Ӧ������У�ÿһ�б�ʾ1�����壬����=����������Ⱥ������
% number_of_variables ��Ӧ������У�����=����������������������Щ������ʾ��
population = rand(population_size, number_of_variables);

last_generation = 0; % ��¼����ѭ��ʱ�Ĵ���


% ����Ĵ��붼��forѭ����
for generation = 1 : maximal_generation % �ݻ�ѭ����ʼ
    
    % feval�����ݴ��뵽һ������õĺ�������м���
    % ��population�������fitness_function��������
    cost = feval(fitness_function, population); % �������и������Ӧ�ȣ�population_size*1�ľ���

    % index��¼�����ÿ��ֵԭ��������
    [cost, index] = sort(cost); % ����Ӧ�Ⱥ���ֵ��С��������

    % index(1:parent_number) 
    % ǰparent_number��cost��С�ĸ�������Ⱥpopulation�е�����
    % ѡ���ⲿ��(parent_number��)������Ϊ��ĸ����ʵparent_number��Ӧ�������
    population = population(index(1:parent_number), :); % �ȱ���һ���ֽ��ŵĸ���
    % ���Կ���population�����ǲ��ϱ仯��

    % cost�ھ���ǰ���sort����󣬾����Ѿ��ı�Ϊ�����
    % cost(1)��Ϊ�����������Ӧ��
    best_fitness(generation) = cost(1); % ��¼�����������Ӧ��

    % population�����һ��Ϊ�����ľ�Ӣ����
    elite(generation, :) = population(1, :); % ��¼���������Ž⣨��Ӣ��

    % �����������Ž����㹻�ã���ֹͣ�ݻ�
    if best_fitness(generation) < minimal_cost; 
        last_generation = generation;
        break; 
    end
    
    % �����������µ���Ⱥ

    % Ⱦɫ�彻�濪ʼ
    for child = 1:2:child_number % ����Ϊ2����Ϊÿһ�ν�������2������
        
        % cumulative_probabilities����Ϊparent_number
        % �������ѡ��2����ĸ����  (child+parent_number)%parent_number
        mother = find(cumulative_probabilities > rand, 1); % ѡ��һ���������ĸ��
        father = find(cumulative_probabilities > rand, 1); % ѡ��һ��������ĸ���
        
        % ceil���컨�壩����ȡ��
        % rand ����һ�������
        % �����ѡ����һ�У���һ�е�ֵ����
        crossover_point = ceil(rand*number_of_variables); % �����ȷ��һ��Ⱦɫ�彻���
        
        % ����crossover_point=3, number_of_variables=5
        % mask1 = 1     1     1     0     0
        % mask2 = 0     0     0     1     1
        mask1 = [ones(1, crossover_point), zeros(1, number_of_variables - crossover_point)];
        mask2 = not(mask1);
        
        % ��ȡ�ֿ���4��Ⱦɫ��
        % ע���� .*
        mother_1 = mask1 .* population(mother, :); % ĸ��Ⱦɫ���ǰ����
        mother_2 = mask2 .* population(mother, :); % ĸ��Ⱦɫ��ĺ󲿷�
        
        father_1 = mask1 .* population(father, :); % ����Ⱦɫ���ǰ����
        father_2 = mask2 .* population(father, :); % ����Ⱦɫ��ĺ󲿷�
        
        % �õ���һ��
        population(parent_number + child, :) = mother_1 + father_2; % һ������
        population(parent_number+child+1, :) = mother_2 + father_1; % ��һ������
        
    end % Ⱦɫ�彻�����
    
    
    % Ⱦɫ����쿪ʼ
    
    % ������Ⱥ
    mutation_population = population(2:population_size, :); % ��Ӣ��������죬���Դ�2��ʼ
    
    number_of_elements = (population_size - 1) * number_of_variables; % ȫ��������Ŀ
    number_of_mutations = ceil(number_of_elements * mutation_rate); % ����Ļ�����Ŀ����������*�����ʣ�
    
    % rand(1, number_of_mutations) ����number_of_mutations�������(��Χ0-1)��ɵľ���(1*number_of_mutations)
    % ���˺󣬾���ÿ��Ԫ�ر�ʾ�����ı�Ļ����λ�ã�Ԫ���ھ����е�һά���꣩
    mutation_points = ceil(number_of_elements * rand(1, number_of_mutations)); % ȷ��Ҫ����Ļ���
    
    % ��ѡ�еĻ��򶼱�һ��������������ɱ���
    mutation_population(mutation_points) = rand(1, number_of_mutations); % ��ѡ�еĻ�����б������
    
    population(2:population_size, :) = mutation_population; % ��������֮�����Ⱥ
    
    % Ⱦɫ��������
   
end % �ݻ�ѭ������

