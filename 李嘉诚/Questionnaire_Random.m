%调查问卷随机数据
 
Q1 = [179 348 98];
Q2 = [333 292];
Q3 = [9 188 278 100 35 15];
Q4 = [348 277];
Q5 = [113 129 187 100 75 21];

Q1_ans = RandomBox(3,Q1);
Q2_ans = RandomBox(2,Q2);
Q3_ans = RandomBox(6,Q3);
Q4_ans = RandomBox(2,Q4);
Q5_ans = RandomBox(6,Q5);

number = 1:625;
data = [Q1_ans,Q2_ans,Q3_ans,Q4_ans,Q5_ans];
group_cell = horzcat(number',data);
xlswrite('数据.xlsx',group_cell,1);