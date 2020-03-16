%************************************%
%Ԥ�������Ԥ��ֵ����������������ͼ
%************************************%
%�������ű���a(��չϵ��)��b(��������)
clear

%ԭʼ���� A
x = xlsread('data.xlsx');
for j = 1:size(x, 2)
    syms a b;
    c = [a b]';
    x = xlsread('data.xlsx');
    A = x(:,j)';
    n = length(A);
    %��ԭʼ���� A ���ۼӵõ����� B
    B = cumsum(A);
    %������ B �����ھ�ֵ����
    for i = 2:n
        C(i) = (B(i) + B(i - 1))/2;
    end
    C(1) = [];
    %�������ݾ���
    B = [-C;ones(1,n-1)];
    Y = A; Y(1) = []; Y = Y';
    %ʹ����С���˷�������� a(��չϵ��)��b(��������)
    c = inv(B*B')*B*Y;
    c = c';
    a = c(1); b = c(2);
    %Ԥ���������
    F = []; F(1) = A(1);
    for i = 2:(n+10)
        F(i) = (A(1)-b/a)/exp(a*(i-1))+ b/a;
    end
    %������ F �ۼ���ԭ,�õ�Ԥ���������
    G = []; G(1) = A(1);
    for i = 2:(n+10)
        G(i) = F(i) - F(i-1); %�õ�Ԥ�����������
    end
    disp('Ԥ������Ϊ��');
    G
    %��������ͼ
    t1 = 2005:2017;
    t2 = 2006:2028;
    figure(1);
    %set(gcf,'outerposition',get(0,'screensize'));
    plot(t1, A,'ro'); 
    hold on;
    plot(t2, G, 'g-');
    xlabel('���');
    danwei = ['���','���','���','��Ԫ','��Ԫ'];
    ylabel(danwei(j));
    set(gca,'looseInset',[0 0 0 0]);
    txt1 = ["ʵ�ʻ���������","ʵ�ʹ�ҵ��������","ʵ������Դ����","ʵ�ʹ���ó������","ʵ������֧������"];
    txt2 = ["Ԥ�����������","Ԥ�⹤ҵ��������","Ԥ������Դ����","Ԥ�����ó������","Ԥ������֧������"];
    legend(txt1(j),txt2(j));
    set(gca,'FontSize',12,'Fontname', 'Times New Roman');
    set(get(gca,'XLabel'),'Fontsize',12,'Fontname', '����');
    set(get(gca,'YLabel'),'Fontsize',12,'Fontname', '����');
    set(get(gca,'legend'),'Fontsize',12,'Fontname', '����');
    set(get(gca,'title'),'Fontsize',12,'Fontname', '����');
    print(gcf,'-dpng','-r300',['ͼ',num2str(j)]);
    close;
    clear
end