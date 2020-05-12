function binPop=m_Coding(pop,pop_length,irange_l)
%% 二进制编码（生成染色体）
% 输入：pop--种群
%      pop_length--编码长度
for n=1:size(pop,2) %列循环
    binPop{n} = '';
    for k=1:size(pop,1) %行循环
        substr = dec2bin(pop(k,n));
        lengthpop = length(substr);
        for s = 1:6-lengthpop
            substr = ['0' substr];
        end
        binPop{n} = [binPop{n} substr];
    end
end

    