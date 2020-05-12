function pop=m_InitPop(numpop,irange_l,irange_r)
%% 初始化种群
%  输入：numpop--种群大小；
%       [irange_l,irange_r]--初始种群所在的区间
pop=[];
for j = 1:numpop
    for i=1:4
        % 因为a,b,f1,f2要求整数，所以生成随机整数
        pop(i,j)= round(irange_l+(irange_r-irange_l)*rand);
    end
end
    