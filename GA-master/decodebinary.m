%����Ŀ�꺯��ֵ
%����������ת��Ϊʮ������(1)
%�Ŵ��㷨�ӳ���
%Name: decodebinary.m
%���� [2^n 2^(n-1) ... 1] ����������Ȼ����ͣ���������ת��Ϊʮ����

function pop2=decodebinary(pop)
[px,py]=size(pop);                   %��pop�к�����
for i=1:py
pop1(:,i)=2.^(py-i).*pop(:,i);
end
pop2=sum(pop1,2);                 %��pop1��ÿ��֮��
