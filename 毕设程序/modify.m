for i = 1:50
    for j = 4:9
        if j == 4
            alloc_info(i,j) = left_road(alloc_info(i,j-3),1);
        elseif j== 5
            alloc_info(i,j) = stright_road(alloc_info(i,j-3),1);
        elseif j == 6
            alloc_info(i,j) = right_road(alloc_info(i,j-3),1);
        elseif j == 7
            alloc_info(i,j) = right_road(alloc_info(i,j-6),2);
        elseif j == 8
            alloc_info(i,j) = right_road(alloc_info(i,j-6),2);
        elseif j == 9
            alloc_info(i,j) = right_road(alloc_info(i,j-6),1);
        end
    end
end