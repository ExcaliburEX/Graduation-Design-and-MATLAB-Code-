% ѡ����
% ѡ����Ʋ����Ǿ�����Щ������Խ�����һ���������в��ö�����ѡ��ѡ�����ַ�������ʵ�֡�
% ���ݷ��� pi=fi/��fi=fi/fsum ��ѡ���裺
% 1�� �ڵ� t �����ɣ�1��ʽ���� fsum �� pi 
% 2�� ���� {0,1} ������� rand( .)���� s=rand( .)*fsum
% 3�� �� ����fi��s ����С�� k ����� k �����屻ѡ��
% 4�� ���� N ��2����3���������õ� N �����壬��Ϊ�� t=t+1 ����Ⱥ
%�Ŵ��㷨�ӳ���
%Name: selection.m
%ѡ����

function [newpop]=selection(pop,fitvalue) 
totalfit=sum(fitvalue);                   %����Ӧֵ֮��
fitvalue=fitvalue/totalfit;                %�������屻ѡ��ĸ���
fitvalue=cumsum(fitvalue);            
%�� fitvalue=[1 2 3 4]���� cumsum(fitvalue)=[1 3 6 10]��Ҫ�ۼӣ����̶ķ������ο��Ƿ���ת�õ������� 
[px,py]=size(pop);                       %20*10
ms=sort(rand(px,1));                   %��С��������
fitin=1;
newin=1;
while newin<=px                          %ѡ��20���¸���
        if(ms(newin))<fitvalue(fitin)
                newpop(newin,:)=pop(fitin,:);
                newin=newin+1;
        else
                fitin=fitin+1;
        end
end
