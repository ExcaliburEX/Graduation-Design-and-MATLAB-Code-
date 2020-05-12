% 变异
% 变异(mutation)，基因的突变普遍存在于生物的进化过程中。变异是指父代中的每个个体的每一位都以概率 pm 翻转，
%即由“1”变为“0”，或由“0”变为“1”。
%遗传算法的变异特性可以使求解过程随机地搜索到解可能存在的整个空间，因此可以 在一定程度上 求得全局最优解。
%遗传算法子程序
%Name: mutation.m
%变异

function [newpop]=mutation(pop,pm)
        [px,py]=size(pop);
        newpop=ones(size(pop));
        for i=1:px
                if(rand<pm)
                        mpoint=round(rand*py);     
%产生的变异点在1-10之间
                        if mpoint<=0
                                mpoint=1;                         
%变异位置
                        end
                        newpop(i,:)=pop(i,:);
                        if any(newpop(i,mpoint))==0
                                newpop(i,mpoint)=1;
                        else
                                newpop(i,mpoint)=0;
                        end
                else
                newpop(i,:)=pop(i,:);
        end
end
