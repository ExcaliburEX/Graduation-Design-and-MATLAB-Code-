clear
clc
popsize=20;                      %群体大小
chromlength=10;                  %字符串长度(个体长度)
pc=0.6;                          %交叉概率，只有在随机数小于pc时，才会产生交叉
pm=0.001;                        %变异概率


pop=initpop(popsize,chromlength);                     %随机产生初始群体
for i=1:20                                            %20为遗传代数
        [objvalue]=calobjvalue(pop);                  %计算目标函数
        fitvalue=calfitvalue(objvalue);               %计算群体中每个个体的适应度

        [newpop]=selection(pop,fitvalue);                
%复制
        [newpop1]=crossover(newpop,pc);              
%交叉
        [newpop2]=mutation(newpop1,pc);              
%变异
        
        [objvalue]=calobjvalue(newpop2);                
%计算目标函数
        fitvalue=calfitvalue(objvalue);                       
%计算群体中每个个体的适应度
        
        [bestindividual,bestfit]=best(newpop2,fitvalue);                    %求出群体中适应值最大的个体及其适应值
        y(i)=bestfit;                                                       %返回的 y 是自适应度值，而非函数值
        x(i)=decodechrom(bestindividual,1,chromlength)*50/1023;             %将自变量解码成十进制
        pop=newpop2;
end

%fplot(@(x)(-x.*x)+50.*x+12)
fplot('-x.*x+50.*x+12',[0,50])
hold on
plot(x,y,'r*')                                          
hold on

[z index]=max(y);             %计算最大值及其位置
xfm=x(index)                   %计算最大值对应的x值
ymax=z