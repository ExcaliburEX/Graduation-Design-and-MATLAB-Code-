% 函数： searchlastcar.m程序代码
function [location_lastcar]=searchlastcar(matrix_cells)
%搜索尾车位置
for i=1:length(matrix_cells)
if matrix_cells(i)~=0
location_lastcar=i;
break;
else %如果路上无车，则空元胞数设定为道路长度
location_lastcar=length(matrix_cells);
end
end