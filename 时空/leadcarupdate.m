function [new_matrix_cells,new_v]=leadcarupdate(matrix_cells,v)
%��һ�������¹���
n=length(matrix_cells);
if v(n)~=0
matrix_cells(n)=0;
v(n)=0;
end
new_matrix_cells=matrix_cells;
new_v=v;