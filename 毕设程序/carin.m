function [s,JL_in] = carin(s,m,m_in,p,vmax)
[a,b]=size(s{1});
s_in=(rand(a,b)<p).*m_in;
s_new=(s{1}==0).*s_in;
JL_in(1)=sum(sum(s_new));%实际进入的
JL_in(2)=sum(sum(s_in));%本该进入的
s{1}=s{1}+s_new;
s{2}=s{2}+(m==1).*s_new.*randi(vmax,a,b);
s{2}=s{2}-(m==2).*s_new.*randi(vmax,a,b);
s{3}=s{3}+(m==3).*s_new.*randi(vmax,a,b);
s{3}=s{3}-(m==4).*s_new.*randi(vmax,a,b);
end

