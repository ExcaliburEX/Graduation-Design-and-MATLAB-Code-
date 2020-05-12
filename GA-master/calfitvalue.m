%遗传算法子程序
%Name:calfitvalue.m
%计算个体的适应值
function fitvalue=calfitvalue(objvalue)

[px,py]=size(objvalue);                   %目标值有正有负
for i=1:px
        if objvalue(i)>0                    
                temp=objvalue(i);          
        else
                temp=0.0;
        end
        fitvalue(i)=temp;
end
fitvalue=fitvalue';
