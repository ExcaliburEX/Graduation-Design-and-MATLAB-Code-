% 将二进制编码转化为十进制数(2)
% decodechrom.m函数的功能是将染色体(或二进制编码)转换为十进制，参数spoint表示待解码的二进制串的起始位置
% (对于多个变量而言，如有两个变量，采用20为表示，每个变量10为，则第一个变量从1开始，另一个变量从11开始。本例为1)，
% 参数1ength表示所截取的长度（本例为10）。
%遗传算法子程序
%Name: decodechrom.m
%将二进制编码转换成十进制

function pop2=decodechrom(pop,spoint,length)          %1  10
pop1=pop(:,spoint:spoint+length-1);
pop2=decodebinary(pop1);                                           %将pop每行转换成十进制值，结果是20*1的矩阵