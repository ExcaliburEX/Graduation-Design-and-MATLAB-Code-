%求出群体中最大得适应值及其个体
%遗传算法子程序
%Name: best.m
%求出第 t 代群体中适应值最大的值
function [bestindividual,bestfit]=best(pop,fitvalue)
[px,py]=size(pop);
bestindividual=pop(1,:);
bestfit=fitvalue(1);
for i=2:px
        if fitvalue(i)>bestfit
                bestindividual=pop(i,:);
                bestfit=fitvalue(i);
        end
end
