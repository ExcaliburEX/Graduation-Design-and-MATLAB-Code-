function [new_v]=randslow(v)
p=0.3; %��������
rand('state',sum(100*clock)*rand(1));%? ��?????�� ??��?
p_rand=rand; %�����������
if p_rand <= p
v=max(v-1,0);
end
new_v=v;