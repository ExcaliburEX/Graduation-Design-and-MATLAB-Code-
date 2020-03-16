clear
%��ȡ����
data =  xlsread('data.xlsx','sheet1');
D = data(:,1);
w = data(:,2);
a = data(:,3);
x = data(:,4);
y = data(:,5);

%��ʼ����
x_d = zeros(1,1000000);
y_d = zeros(1,1000000);
awx = zeros(1,1000000);
awy = zeros(1,1000000);
aw = zeros(1,1000000);
d = zeros(1,1000000);
W  = zeros(1,1000000);

 for j = 1:length(D)
       awx(1) =  awx(1) + a(j) * w(j) * x(j);
       awy(1) =  awy(1) + a(j) * w(j) * y(j);
       aw(1)   =  aw(1)   + a(j) * w(j);
  end
  x_d(1) = awx(1) / aw(1);
  y_d(1) = awy(1) / aw(1);
  for j = 1:length(D)
      d(j)= distance(x_d(1),y_d(1),x(j),y(j));    
  end
 for j = 1:length(D)
      W(1) = W(1)+a(j)* w(j) * d(j);
 end
  
 
for i = 2:1000000
     for j = 1:length(D)
       awx(i) =  awx(i) + a(j) * w(j) * x(j)/d(j);
       awy(i) =  awy(i) + a(j) * w(j) * y(j)/d(j);
       aw(i)   =  aw(i)   + a(j) * w(j)/d(j);
     end
  x_d(i) = awx(i) / aw(i);
  y_d(i) = awy(i) / aw(i);
  for j = 1:length(D)
      d(j)= distance(x_d(i),y_d(i),x(j),y(j));    
  end
  for j = 1:length(D)
      W(i) = W(i) + a(j)* w(j) * d(j);
  end
  if W(i)> W(i-1)
      disp(['���ν������һ�δ󣬹����Ž��Ϊ��',num2str(W(i-1))]);
      break
  end
  if abs(W(i)-W(i-1)) < 0.00000000000000001
      disp(['���þ���Ϊ0.00000000001ʱ�����Ž��Ϊ��',num2str(W(i))]);
      break
  end
  disp(['��',num2str(i-1),'�ε���']);
end
x_d(x_d == 0)= [];
y_d(y_d == 0)= [];
W(W==0)=[];
 xlswrite('result.xlsx',{'xd'},1,'A1');
 xlswrite('result.xlsx',x_d(:),1,'A2');
 
 xlswrite('result.xlsx',{'yd'},1,'B1');
 xlswrite('result.xlsx',y_d(:),1,'B2');
 
xlswrite('result.xlsx',{'D'},1,'C1');
 xlswrite('result.xlsx',W(:),1,'C2');
Plot3D(x_d,y_d,W);





