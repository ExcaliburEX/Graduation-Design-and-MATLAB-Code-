%************************************%
%预测各数据预测值，并绘制增长趋势图
%************************************%
%建立符号变量a(发展系数)和b(灰作用量)
clear

%原始数列 A
x = xlsread('data.xlsx');
for j = 1:size(x, 2)
    syms a b;
    c = [a b]';
    x = xlsread('data.xlsx');
    A = x(:,j)';
    n = length(A);
    %对原始数列 A 做累加得到数列 B
    B = cumsum(A);
    %对数列 B 做紧邻均值生成
    for i = 2:n
        C(i) = (B(i) + B(i - 1))/2;
    end
    C(1) = [];
    %构造数据矩阵
    B = [-C;ones(1,n-1)];
    Y = A; Y(1) = []; Y = Y';
    %使用最小二乘法计算参数 a(发展系数)和b(灰作用量)
    c = inv(B*B')*B*Y;
    c = c';
    a = c(1); b = c(2);
    %预测后续数据
    F = []; F(1) = A(1);
    for i = 2:(n+10)
        F(i) = (A(1)-b/a)/exp(a*(i-1))+ b/a;
    end
    %对数列 F 累减还原,得到预测出的数据
    G = []; G(1) = A(1);
    for i = 2:(n+10)
        G(i) = F(i) - F(i-1); %得到预测出来的数据
    end
    disp('预测数据为：');
    G
    %绘制曲线图
    t1 = 2005:2017;
    t2 = 2006:2028;
    figure(1);
    %set(gcf,'outerposition',get(0,'screensize'));
    plot(t1, A,'ro'); 
    hold on;
    plot(t2, G, 'g-');
    xlabel('年份');
    danwei = ['万吨','万吨','万吨','亿元','亿元'];
    ylabel(danwei(j));
    set(gca,'looseInset',[0 0 0 0]);
    txt1 = ["实际货运量增长","实际工业产量增长","实际新能源增长","实际国内贸易增长","实际消费支出增长"];
    txt2 = ["预测货运量增长","预测工业产量增长","预测新能源增长","预测国内贸易增长","预测消费支出增长"];
    legend(txt1(j),txt2(j));
    set(gca,'FontSize',12,'Fontname', 'Times New Roman');
    set(get(gca,'XLabel'),'Fontsize',12,'Fontname', '宋体');
    set(get(gca,'YLabel'),'Fontsize',12,'Fontname', '宋体');
    set(get(gca,'legend'),'Fontsize',12,'Fontname', '宋体');
    set(get(gca,'title'),'Fontsize',12,'Fontname', '宋体');
    print(gcf,'-dpng','-r300',['图',num2str(j)]);
    close;
    clear
end