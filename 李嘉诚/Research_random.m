%产生调查问卷的随机数据，保存在'数据.xlsx'中的MATLANB代码
train_cost = [103,105,107];
train_time = [120,150,160];
train_interval = [60,120,150];

coach_cost = [90,100,140];
coach_time = [180,195,210];
coach_interval = [30,45,60];

car_cost = [140,165];
car_time = [240,180];

group_cell = [];
for i = 1:27
    for j = 1:8
        switch j
            case 1
                group_cell(i,j) = train_cost(randi(length(train_cost),1,1));
            case 2
                group_cell(i,j) = train_time(randi(length(train_time),1,1));
            case 3
                group_cell(i,j)= train_interval(randi(length(train_interval),1,1));
            case 4
                group_cell(i,j) = coach_cost(randi(length(coach_cost),1,1));
            case 5
                group_cell(i,j) = coach_time(randi(length(coach_time),1,1));
            case 6
                 group_cell(i,j) = coach_interval(randi(length(coach_interval),1,1));
            case 7
                group_cell(i,j) = car_cost(randi(length(car_cost),1,1));
            case 8
                group_cell(i,j) = car_time(randi(length(car_time),1,1));
        end
    end
end
number = 1:27;
group_cell = horzcat(number',group_cell);
xlswrite('数据.xlsx',group_cell,1);
    

