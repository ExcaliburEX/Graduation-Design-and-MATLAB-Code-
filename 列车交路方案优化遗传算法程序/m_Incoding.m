function pop=m_Incoding(binPop,irange_l)
%% ����
popNum=1;
popNum = 4;%Ⱦɫ������Ĳ�������
for n=1:size(binPop,2)
    % ��Ϊ��35����վ��35<2^6 �����Ա���Ϊ6λ
    pop(1,n) = bin2dec(binPop{1,n}(1:6)); 
    pop(2,n) = bin2dec(binPop{1,n}(7:12));
    pop(3,n) = bin2dec(binPop{1,n}(13:18));
    pop(4,n) = bin2dec(binPop{1,n}(19:24));
end
% pop = pop./10^6+irange_l;
