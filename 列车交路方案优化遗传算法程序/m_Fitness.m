function fitness=m_Fitness(pop, OD, h)
%% Fitness Function
for n=1:size(pop,2)
    a = pop(1,n);
    b = pop(2,n);
    f1 = pop(3,n);
    f2 = pop(4,n);
%% 约束条件，不满足约束则适应度值无穷小    
 %% 1) a,b,f1,f2 不能为0
    if a == 0 || b == 0 || f1 == 0 || f2 == 0
        fitness(n) = 1/1000000000;
        continue;
    end
 %% 2) a,b,f1,f2 不能超过35
    if a > 35 || b > 35 || f1 >35 || f2 >35 
         fitness(n) = 1/1000000000;
        continue;
    end
%% 3) 列车数量约束
     if (sum(h) * 120 + 1170) *( f1 - 16) + (sum(h(a: b-1)) + (b - a + 1) * 30 + 120) * f2 > 0
        fitness(n) = 1/1000000000;
        continue;
     end
%% 4) 满载率约束   
%     constraint2 = [];
%     for j = 2:33
%         constraint2(j) = (sum(sum(OD(1:j, j+1:35)))/(f1+f2)) * (sum(sum(OD(j+1:35,1:j)))/(f1+f2));
%     end
%     if max(constraint2) > 1 * 1460
%         fitness(n) = 1/1000000000;
%         continue;
%     end
%% 5) 最小追踪间隔     
    if f1 + f2 > 30
        fitness(n) = 1/1000000000;
        continue;
    end 
%% 5) 最小发车间隔   
    if f1 < 12
          fitness(n) = 1/1000000000;
           continue;
    end
%% 主要适应度函数，设置为目标函数的倒数，即目标函数要求最小，那么越小，适应度就越大    
    fitness(n)= 1/m_Fx(pop(:,n), OD);
end
