function s=s_ini(m,p,vmax)
%pΪ��ʼ�г���
%vmaxΪ����ٶ�
s=cell(1,3);
[a,b]=size(m);
%���޳�
s{1}=(rand(a,b)<=p).*(m~=0);
s{1}(m==5)=0;
%vx
s{2}=randi([0,vmax],a,b).*(m==1).*s{1};
s{2}=s{2}+randi([-vmax,0],a,b).*(m==2).*s{1};
%vy
s{3}=randi([0,vmax],a,b).*(m==3).*s{1};
s{3}=s{3}+randi([-vmax,0],a,b).*(m==4).*s{1};
end

