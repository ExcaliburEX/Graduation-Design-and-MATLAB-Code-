function loc = fun_loc(m,i,j)
%m�ǵ�ͼ
%i,j��Ҫ�жϵ������
if m(i+1,j)==5||m(i+1,j)==6
    if m(i,j+1)==5||m(i,j+1)==6
        loc=1;
    else
        loc=2;
    end
else
    if m(i,j+1)==5||m(i,j+1)==6
        loc=3;
    else
        loc=4;
    end
end
end


