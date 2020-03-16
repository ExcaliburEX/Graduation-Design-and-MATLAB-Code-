function [JL,JL_in,r,alloc_info]=CAtraffic(o,pa,T,N,vmax,k,draw)
%���룺
%       o���Ƿ񿪷�С����1�ǣ�0��
%       pa����������:
%               pa(1)���복���ʡ�
%               pa(2)��ת����ʡ�
%               pa(3)����ʼ�г��ʡ�
%       T���źŵ�����:
%               T(1)������ͨ��ʱ����
%               T(2)���ϱ�ͨ��ʱ����
%       N������������
%       vmax������ٶȡ�
%       k������ϵ��:
%               k(1)����ǰ���ٶ��������ʵ�Ӱ�졣
%               k(2)��ǰ�������ڳ��������������ʵ�Ӱ�졣
%       draw�����ӻ����ƣ�1�������ӻ���0�رտ��ӻ���
%�����
%       JL��ÿʱ��Ԫ��״̬��¼��
%       JL_in����������ϵͳ�����¼:
%               JL_in(:,1)Ϊʵ�ʽ��복����
%               JL_in(:,2)Ϊ���ý��복����
%       r��·�ڣ������к��̵ƺ��޺��̵Ƶģ�����ռ�ܿ�ͨ������ı�ֵ��
global e_1 e_2 e_3;
p=pa(1);%�복����
p_turn=pa(2);%ת�����
p_ini_car=pa(3);%��ʼ�г���

[m,m_in,r]=m_ini(o);
s=s_ini(m,p_ini_car,vmax);

JL=cell(N,1);
JL_in=zeros(N,2);
alloc_info = [];
for i=1:N
    [s,JL_in(i,:)]= carin(s,m,m_in,p,vmax);
    s=rand_slow(s,k);
    s=goforward(s,m,i,T,p_turn,vmax);
    if draw==1
        imagesc(s{1});
        set(gca,'FontSize',20,'Fontname', 'Times New Roman');
        drawnow
    end
    JL{i}=s;
    
    e_1 = sum(sum(JL{i,1}{1,1}(1:36,15:16))) * 100;
    e_2 = sum(sum(JL{i,1}{1,1}(35:36,1:46))) * 100;
    e_3 = sum(sum(JL{i,1}{1,1}(36:75,15:16))) * 100;
    if rem(i,10) == 0
        chromosome = nsga_2_optimization(i/10);
        index = randi(size(chromosome,1),1,1);
        for j = 1:9
            if j >= 1 && j <= 3
                alloc_info(i/10,j) = chromosome(index,j);
            elseif j== 4
                alloc_info(i/10,j) = left_road(chromosome(i/10,j-3),1);
            elseif j == 5
                alloc_info(i/10,j) = stright_road(chromosome(i/10,j-3),1);
            elseif j == 6
                alloc_info(i/10,j) = right_road(chromosome(i/10,j-3),1);
            elseif j == 7
                alloc_info(i/10,j) = left_road(chromosome(i/10,j-6),2);
            elseif j == 8
                alloc_info(i/10,j) = stright_road(chromosome(i/10,j-6),2);
            elseif j == 9
                alloc_info(i/10,j) = right_road(chromosome(i/10,j-6),2);
            end
        end
    end
end
