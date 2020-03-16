%% �Գ�ʼ��Ⱥ��ʼ���� ���ٷ�֧������
% ʹ�÷�֧���������Ⱥ�������򡣸ú�������ÿ�������Ӧ������ֵ��ӵ�����룬��һ�����еľ���  
% ��������ֵ��ӵ��������ӵ�Ⱦɫ������� 
function f = non_domination_sort_mod(x, M, V)
[N, ~] = size(x);% NΪ����x��������Ҳ����Ⱥ������
clear m
front = 1;
F(front).f = [];
individual = [];
 
for i = 1 : N
    individual(i).n = 0;%n�Ǹ���i��֧��ĸ�������
    individual(i).p = [];%p�Ǳ�����i֧��ĸ��弯��
    for j = 1 : N
        dom_less = 0;
        dom_equal = 0;
        dom_more = 0;
        for k = 1 : M        %�жϸ���i�͸���j��֧���ϵ
            if (x(i,V + k) < x(j,V + k))  
                dom_less = dom_less + 1;
            elseif (x(i,V + k) == x(j,V + k))
                dom_equal = dom_equal + 1;
            else
                dom_more = dom_more + 1;
            end
        end
        if dom_less == 0 && dom_equal ~= M % ˵��i��j֧�䣬��Ӧ��n��1
            individual(i).n = individual(i).n + 1;
        elseif dom_more == 0 && dom_equal ~= M % ˵��i֧��j,��j����i��֧��ϼ���
            individual(i).p = [individual(i).p j];
        end
    end   
    if individual(i).n == 0 %����i��֧��ȼ�������ߣ����ڵ�ǰ���Ž⼯����Ӧ��Ⱦɫ����Я����������������Ϣ
        x(i,M + V + 1) = 1;
        F(front).f = [F(front).f i];%�ȼ�Ϊ1�ķ�֧��⼯
    end
end
%����Ĵ�����Ϊ���ҳ��ȼ���ߵķ�֧��⼯
%����Ĵ�����Ϊ�˸�����������зּ�
while ~isempty(F(front).f)
   Q = []; %�����һ��front����
   for i = 1 : length(F(front).f)%ѭ����ǰ֧��⼯�еĸ���
       if ~isempty(individual(F(front).f(i)).p)%����i���Լ���֧��Ľ⼯
        	for j = 1 : length(individual(F(front).f(i)).p)%ѭ������i��֧��⼯�еĸ���
            	individual(individual(F(front).f(i)).p(j)).n = ...%...��ʾ��������һ�д����������ģ� �����ʾ����j�ı�֧�������1
                	individual(individual(F(front).f(i)).p(j)).n - 1;
        	   	 if individual(individual(F(front).f(i)).p(j)).n == 0% ���q�Ƿ�֧��⼯������뼯��Q��
               		x(individual(F(front).f(i)).p(j),M + V + 1) = ...%����Ⱦɫ���м���ּ���Ϣ
                        front + 1;
                    Q = [Q individual(F(front).f(i)).p(j)];
                end
            end
       end
   end
   front =  front + 1;
   F(front).f = Q;
end
 
[temp,index_of_fronts] = sort(x(:,M + V + 1));%�Ը���Ĵ�������ȼ��������������������� index_of_fronts��ʾ������ֵ��Ӧԭ��������
for i = 1 : length(index_of_fronts)
    sorted_based_on_front(i,:) = x(index_of_fronts(i),:);%sorted_based_on_front�д�ŵ���x����������ȼ����������ľ���
end
current_index = 0;
 
%% Crowding distance ����ÿ�������ӵ����
 
for front = 1 : (length(F) - 1)%�����1����Ϊ����55�����F�����һ��Ԫ��Ϊ�գ�������������ѭ��������һ����length-1������ȼ�
    distance = 0;
    y = [];
    previous_index = current_index + 1;
    for i = 1 : length(F(front).f)
        y(i,:) = sorted_based_on_front(current_index + i,:);%y�д�ŵ�������ȼ�Ϊfront�ļ��Ͼ���
    end
    current_index = current_index + i;%current_index =i
    sorted_based_on_objective = [];%��Ż���ӵ����������ľ���
    for i = 1 : M
        [sorted_based_on_objective, index_of_objectives] = ...
            sort(y(:,V + i));%����Ŀ�꺯��ֵ����
        sorted_based_on_objective = [];
        for j = 1 : length(index_of_objectives)
            sorted_based_on_objective(j,:) = y(index_of_objectives(j),:);% sorted_based_on_objective��Ű���Ŀ�꺯��ֵ������x����
        end
        f_max = ...
            sorted_based_on_objective(length(index_of_objectives), V + i);%fmaxΪĿ�꺯�����ֵ fminΪĿ�꺯����Сֵ
        f_min = sorted_based_on_objective(1, V + i);
        y(index_of_objectives(length(index_of_objectives)),M + V + 1 + i)...%�������ĵ�һ����������һ������ľ�����Ϊ�����
            = Inf;
        y(index_of_objectives(1),M + V + 1 + i) = Inf;
         for j = 2 : length(index_of_objectives) - 1%ѭ�������г��˵�һ�������һ���ĸ���
            next_obj  = sorted_based_on_objective(j + 1,V + i);
            previous_obj  = sorted_based_on_objective(j - 1,V + i);
            if (f_max - f_min == 0)
                y(index_of_objectives(j),M + V + 1 + i) = Inf;
            else
                y(index_of_objectives(j),M + V + 1 + i) = ...
                     (next_obj - previous_obj)/(f_max - f_min);
            end
         end
    end
    distance = [];
    distance(:,1) = zeros(length(F(front).f),1);
    for i = 1 : M
        distance(:,1) = distance(:,1) + y(:,M + V + 1 + i);
    end
    y(:,M + V + 2) = distance;
    y = y(:,1 : M + V + 2);
    z(previous_index:current_index,:) = y;
end
f = z();%�õ������Ѿ������ȼ���ӵ���ȵ���Ⱥ���� �����Ѿ����ȼ���������