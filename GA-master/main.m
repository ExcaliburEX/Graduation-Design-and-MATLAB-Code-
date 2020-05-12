clear
clc
popsize=20;                      %Ⱥ���С
chromlength=10;                  %�ַ�������(���峤��)
pc=0.6;                          %������ʣ�ֻ���������С��pcʱ���Ż��������
pm=0.001;                        %�������


pop=initpop(popsize,chromlength);                     %���������ʼȺ��
for i=1:20                                            %20Ϊ�Ŵ�����
        [objvalue]=calobjvalue(pop);                  %����Ŀ�꺯��
        fitvalue=calfitvalue(objvalue);               %����Ⱥ����ÿ���������Ӧ��

        [newpop]=selection(pop,fitvalue);                
%����
        [newpop1]=crossover(newpop,pc);              
%����
        [newpop2]=mutation(newpop1,pc);              
%����
        
        [objvalue]=calobjvalue(newpop2);                
%����Ŀ�꺯��
        fitvalue=calfitvalue(objvalue);                       
%����Ⱥ����ÿ���������Ӧ��
        
        [bestindividual,bestfit]=best(newpop2,fitvalue);                    %���Ⱥ������Ӧֵ���ĸ��弰����Ӧֵ
        y(i)=bestfit;                                                       %���ص� y ������Ӧ��ֵ�����Ǻ���ֵ
        x(i)=decodechrom(bestindividual,1,chromlength)*50/1023;             %���Ա��������ʮ����
        pop=newpop2;
end

%fplot(@(x)(-x.*x)+50.*x+12)
fplot('-x.*x+50.*x+12',[0,50])
hold on
plot(x,y,'r*')                                          
hold on

[z index]=max(y);             %�������ֵ����λ��
xfm=x(index)                   %�������ֵ��Ӧ��xֵ
ymax=z