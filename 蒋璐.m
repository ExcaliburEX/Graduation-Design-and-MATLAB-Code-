clear
N = 720;
HeartBeat = randsrc(N, 1,[1 2 3 4;0.005, 0.4,0.59,0.005]);
HeartData = zeros(N,1);
for i =1:720
    switch HeartBeat(i)
        case 1
            HeartData(i) = 50 + rand()*  10;
        case 2
           HeartData(i) = 60 + rand()*  20;
        case 3
           HeartData(i) = 80 + rand()*  20; 
        case 4
           HeartData(i) = 100 + rand()*  20;
    end
end

HighPress = randsrc(N, 1,[1 2 3 4;0.005, 0.4,0.59,0.005]);
HighPressData = zeros(N,1);
for i =1:720
    switch HighPress(i)
        case 1
            HighPressData(i) = 70 + rand()*  20;
        case 2
           HighPressData(i) = 90 + rand()*  30;
        case 3
           HighPressData(i) = 120 + rand()*  20; 
        case 4
           HighPressData(i) = 140 + rand()*  20;
    end
end

LowPress = randsrc(N, 1,[1 2 3 4;0.005, 0.4,0.59,0.005]);
LowPressData = zeros(N,1);
for i =1:720
    switch LowPress(i)
        case 1
            LowPressData(i) = 50 + rand()*  10;
        case 2
           LowPressData(i) = 60 + rand()*  20;
        case 3
           LowPressData(i) = 80 + rand()*  10; 
        case 4
           LowPressData(i) = 90 + rand()*  20;
    end
end

figure(1);
set(gcf,'outerposition',get(0,'screensize'));
plot(HeartData(:),'b*-');
set(gca,'FontSize',24,'Fontname', 'Times New Roman');
xlabel('\fontname{����}ʱ��/Сʱ');
ylabel('\fontname{����}����ֵ');
%set(gca,'looseInset',[0 0 0 0]);
set(get(gca,'XLabel'),'Fontsize',20,'Fontname', '����');
set(get(gca,'YLabel'),'Fontsize',20,'Fontname', '����');
print(1,'-dpng','-r300','����ͼ');

figure(2);
set(gcf,'outerposition',get(0,'screensize'));
plot(HighPressData,'ro-');hold on;
plot(LowPressData,'gd-');
set(gca,'FontSize',24,'Fontname', 'Times New Roman');
xlabel('\fontname{����}ʱ��/Сʱ');
ylabel('\fontname{����}Ѫѹֵ');
%set(gca,'looseInset',[0 0 0 0]);
set(get(gca,'XLabel'),'Fontsize',20,'Fontname', '����');
set(get(gca,'YLabel'),'Fontsize',20,'Fontname', '����');
legend('\fontname{����}��Ѫѹ','\fontname{����}��Ѫѹ');
print(2,'-dpng','-r300','Ѫѹͼ');

xlswrite('data.xlsx',{'����'},1,'A1');
xlswrite('data.xlsx',HeartData,1,'A2');

xlswrite('data.xlsx',{'��Ѫѹ'},1,'B1');
xlswrite('data.xlsx',HighPressData,1,'B2');

xlswrite('data.xlsx',{'��Ѫѹ'},1,'C1');
xlswrite('data.xlsx',LowPressData,1,'C2');






