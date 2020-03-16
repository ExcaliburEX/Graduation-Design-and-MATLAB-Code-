function [new_v]=randslow(v)
p=0.3; %慢化概率
rand('state',sum(100*clock)*rand(1));%? ¨?????ú ??×?
p_rand=rand; %产生随机概率
if p_rand <= p
v=max(v-1,0);
end
new_v=v;