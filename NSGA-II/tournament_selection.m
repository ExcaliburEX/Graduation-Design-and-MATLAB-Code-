function f = tournament_selection(chromosome, pool_size, tour_size)
[pop, variables] = size(chromosome);%获得种群的个体数量和决策变量数量
rank = variables - 1;%个体向量中排序值所在位置
distance = variables;%个体向量中拥挤度所在位置
%竞标赛选择法，每次随机选择两个个体，优先选择排序等级高的个体，如果排序等级一样，优选选择拥挤度大的个体
for i = 1 : pool_size
    for j = 1 : tour_size
        candidate(j) = round(pop*rand(1));%随机选择参赛个体
        if candidate(j) == 0
            candidate(j) = 1;
        end
        if j > 1
            while ~isempty(find(candidate(1 : j - 1) == candidate(j)))%防止两个参赛个体是同一个
                candidate(j) = round(pop*rand(1));
                if candidate(j) == 0
                    candidate(j) = 1;
                end
            end
        end
    end
    for j = 1 : tour_size% 记录每个参赛者的排序等级 拥挤度
        c_obj_rank(j) = chromosome(candidate(j),rank);
        c_obj_distance(j) = chromosome(candidate(j),distance);
    end
    min_candidate = ...
        find(c_obj_rank == min(c_obj_rank));%选择排序等级较小的参赛者，find返回该参赛者的索引
    if length(min_candidate) ~= 1%如果两个参赛者的排序等级相等 则继续比较拥挤度 优先选择拥挤度大的个体
        max_candidate = ...
        find(c_obj_distance(min_candidate) == max(c_obj_distance(min_candidate)));
        if length(max_candidate) ~= 1
            max_candidate = max_candidate(1);
        end
        f(i,:) = chromosome(candidate(min_candidate(max_candidate)),:);
    else
        f(i,:) = chromosome(candidate(min_candidate(1)),:);
    end
end