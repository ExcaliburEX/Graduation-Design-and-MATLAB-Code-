% ����
% ����(mutation)�������ͻ���ձ����������Ľ��������С�������ָ�����е�ÿ�������ÿһλ���Ը��� pm ��ת��
%���ɡ�1����Ϊ��0�������ɡ�0����Ϊ��1����
%�Ŵ��㷨�ı������Կ���ʹ���������������������ܴ��ڵ������ռ䣬��˿��� ��һ���̶��� ���ȫ�����Ž⡣
%�Ŵ��㷨�ӳ���
%Name: mutation.m
%����

function [newpop]=mutation(pop,pm)
        [px,py]=size(pop);
        newpop=ones(size(pop));
        for i=1:px
                if(rand<pm)
                        mpoint=round(rand*py);     
%�����ı������1-10֮��
                        if mpoint<=0
                                mpoint=1;                         
%����λ��
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
