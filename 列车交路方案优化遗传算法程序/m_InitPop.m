function pop=m_InitPop(numpop,irange_l,irange_r)
%% ��ʼ����Ⱥ
%  ���룺numpop--��Ⱥ��С��
%       [irange_l,irange_r]--��ʼ��Ⱥ���ڵ�����
pop=[];
for j = 1:numpop
    for i=1:4
        % ��Ϊa,b,f1,f2Ҫ�����������������������
        pop(i,j)= round(irange_l+(irange_r-irange_l)*rand);
    end
end
    