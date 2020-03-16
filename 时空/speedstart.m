function [v_matixcells]=speedstart(matrix_cells,vmax)
%道路初始状态车辆速度初始化
v_matixcells=zeros(1,length(matrix_cells));
for i=1:length(matrix_cells)
if matrix_cells(i)~=0
v_matixcells(i)=round(vmax*rand(1));
end
end