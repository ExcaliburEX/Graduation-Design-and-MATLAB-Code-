function f = initialize_variables(N, M, V, min_range, max_range)%f��һ������Ⱥ������ɵľ���
min = min_range;
max = max_range;
K = M + V;%%K���������Ԫ�ظ�����Ϊ�˱��ڼ��㣬���߱�����Ŀ�꺯������һ���γ�һ�����顣  
%���ڽ���ͱ��죬����Ŀ������Ծ��߱�������ѡ��
for i = 1 : N
    for j = 1 : V
            f(i,j) =( min(j) + (max(j) - min(j))*rand(1))*10;%f(i j)��ʾ������Ⱥ�е�i�������еĵ�j�����߱������д���Ϊÿ����������о��߱�����Լ�����������ȡֵ
    end
    f(i,V + 1: K) = evaluate_objective(f(i,:), M, V); % M��Ŀ�꺯������ V�Ǿ��߱�������
                                                    %Ϊ�˼򻯼��㽫��Ӧ��Ŀ�꺯��ֵ������Ⱦɫ���V + 1 �� K��λ�á�
end