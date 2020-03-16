function BOX = RandomBox(num,num_matrix)
Box = zeros(625,1);
if num == 2
    Box(1:num_matrix(1),:) = 1;
    Box(num_matrix(1)+1:end,:) = 2;
end
if num == 3
    Box(1:num_matrix(1),:) = 1;
    Box(num_matrix(1)+1:num_matrix(1)+num_matrix(2),:) = 2;
    Box(num_matrix(1)+num_matrix(2)+1:end,:) = 3;
end
if num == 6
    Box(1:num_matrix(1),:) = 1;
    Box(num_matrix(1)+1:num_matrix(1)+num_matrix(2),:) = 2;
    Box(num_matrix(1)+num_matrix(2)+1:num_matrix(1)+num_matrix(2)+num_matrix(3),:) = 3;
    Box(num_matrix(1)+num_matrix(2)+num_matrix(3)+1:num_matrix(1)+num_matrix(2)+num_matrix(3)+num_matrix(4),:) = 4;
    Box(num_matrix(1)+num_matrix(2)+num_matrix(3)+num_matrix(4)+1:num_matrix(1)+num_matrix(2)+num_matrix(3)+num_matrix(4)+num_matrix(5),:) = 5;
    Box(num_matrix(1)+num_matrix(2)+num_matrix(3)+num_matrix(4)+num_matrix(5)+1:end,:)=6;
end
randindex =  randperm(length(Box));
BOX =Box(randindex);
end

