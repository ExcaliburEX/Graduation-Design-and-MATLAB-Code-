% ������ searchlastcar.m�������
function [location_lastcar]=searchlastcar(matrix_cells)
%����β��λ��
for i=1:length(matrix_cells)
if matrix_cells(i)~=0
location_lastcar=i;
break;
else %���·���޳������Ԫ�����趨Ϊ��·����
location_lastcar=length(matrix_cells);
end
end