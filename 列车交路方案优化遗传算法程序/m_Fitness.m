function fitness=m_Fitness(pop, OD, h)
%% Fitness Function
for n=1:size(pop,2)
    a = pop(1,n);
    b = pop(2,n);
    f1 = pop(3,n);
    f2 = pop(4,n);
%% Լ��������������Լ������Ӧ��ֵ����С    
 %% 1) a,b,f1,f2 ����Ϊ0
    if a == 0 || b == 0 || f1 == 0 || f2 == 0
        fitness(n) = 1/1000000000;
        continue;
    end
 %% 2) a,b,f1,f2 ���ܳ���35
    if a > 35 || b > 35 || f1 >35 || f2 >35 
         fitness(n) = 1/1000000000;
        continue;
    end
%% 3) �г�����Լ��
     if (sum(h) * 120 + 1170) *( f1 - 16) + (sum(h(a: b-1)) + (b - a + 1) * 30 + 120) * f2 > 0
        fitness(n) = 1/1000000000;
        continue;
     end
%% 4) ������Լ��   
%     constraint2 = [];
%     for j = 2:33
%         constraint2(j) = (sum(sum(OD(1:j, j+1:35)))/(f1+f2)) * (sum(sum(OD(j+1:35,1:j)))/(f1+f2));
%     end
%     if max(constraint2) > 1 * 1460
%         fitness(n) = 1/1000000000;
%         continue;
%     end
%% 5) ��С׷�ټ��     
    if f1 + f2 > 30
        fitness(n) = 1/1000000000;
        continue;
    end 
%% 5) ��С�������   
    if f1 < 12
          fitness(n) = 1/1000000000;
           continue;
    end
%% ��Ҫ��Ӧ�Ⱥ���������ΪĿ�꺯���ĵ�������Ŀ�꺯��Ҫ����С����ôԽС����Ӧ�Ⱦ�Խ��    
    fitness(n)= 1/m_Fx(pop(:,n), OD);
end
