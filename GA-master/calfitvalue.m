%�Ŵ��㷨�ӳ���
%Name:calfitvalue.m
%����������Ӧֵ
function fitvalue=calfitvalue(objvalue)

[px,py]=size(objvalue);                   %Ŀ��ֵ�����и�
for i=1:px
        if objvalue(i)>0                    
                temp=objvalue(i);          
        else
                temp=0.0;
        end
        fitvalue(i)=temp;
end
fitvalue=fitvalue';
