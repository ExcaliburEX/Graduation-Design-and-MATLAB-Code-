function pop=m_Incoding(binPop,irange_l)
%% 解码
popNum=1;
popNum = 4;%染色体包含的参数数量
for n=1:size(binPop,2)
    % 因为有35个车站，35<2^6 ，所以编码为6位
    pop(1,n) = bin2dec(binPop{1,n}(1:6)); 
    pop(2,n) = bin2dec(binPop{1,n}(7:12));
    pop(3,n) = bin2dec(binPop{1,n}(13:18));
    pop(4,n) = bin2dec(binPop{1,n}(19:24));
end
% pop = pop./10^6+irange_l;
