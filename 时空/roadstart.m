function [matrix_cells_start]=roadstart(matrix_cells,n)
%��·�ϵĳ�����ʼ��״̬��Ԫ���������Ϊ 0�� 1��matrix_cells ��ʼ���� n��ʼ������
k=length(matrix_cells);
z=round(k*rand(1,n));
for i=1:n
j=z(i);
if j==0
matrix_cells(j)=0;
else
matrix_cells(j)=1;
end
end
matrix_cells_start=matrix_cells;