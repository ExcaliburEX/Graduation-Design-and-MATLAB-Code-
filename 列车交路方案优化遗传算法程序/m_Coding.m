function binPop=m_Coding(pop,pop_length,irange_l)
%% �����Ʊ��루����Ⱦɫ�壩
% ���룺pop--��Ⱥ
%      pop_length--���볤��
for n=1:size(pop,2) %��ѭ��
    binPop{n} = '';
    for k=1:size(pop,1) %��ѭ��
        substr = dec2bin(pop(k,n));
        lengthpop = length(substr);
        for s = 1:6-lengthpop
            substr = ['0' substr];
        end
        binPop{n} = [binPop{n} substr];
    end
end

    