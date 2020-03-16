clear
clc
%计算模糊综合评价模型的W，R，B，结果放在'result.xlsx'
w1 = [0.4773,0.2880,0.1538,0.0809];
w2 = [0.149,0.420,0.099,0.264,0.068];
w3 = [0.238,0.626,0.136];
w4 = [0.4549,0.1606,0.0619,0.3226 ];
w5 = [0.538,0.087,0.258,0.117];

R1 = [0.2	0.2	0.5	0.1;
0.1	0.4	0.3	0.2;
0.6	0.2	0.2	0;
0.5	0.2	0.2	0.1];

R2 = [0.3	0.4	0.2	0.1;
0.3	0.3	0.3	0.1;
0.1	0.4	0.3	0.2;
0.2	0.3	0.3	0.2;
0.4	0.4	0.2	0];

R3 = [0.4	0.3	0.3	0;
0.5	0.3	0.2	0;
0.8	0.2	0	0];

R4 = [0.6	0.2	0.2	0;
0.2	0.3	0.5	0;
0.4	0.4	0.1	0.1;
0.3	0.2	0	0.5];

R5 = [0.7	0.2	0.1	0;
0.5	0.2	0.2	0.1;
0.6	0.2	0.2	0.1;
0.3	0.2	0.2	0.3];

B1 = w1 * R1;
B2 = w2 * R2;
B3 = w3 * R3;
B4 = w4 * R4;
B5 = w5 * R5;

R = [B1;B2;B3;B4;B5];
A  = [0.405,0.253,0.079,0.207,0.056];

B = A * R;

xlswrite('result.xlsx',{'B1'},1,'A1');
xlswrite('result.xlsx',B1,1,'B1');

xlswrite('result.xlsx',{'B2'},1,'A2');
xlswrite('result.xlsx',B2,1,'B2');

xlswrite('result.xlsx',{'B3'},1,'A3');
xlswrite('result.xlsx',B3,1,'B3');

xlswrite('result.xlsx',{'B4'},1,'A4');
xlswrite('result.xlsx',B4,1,'B4');

xlswrite('result.xlsx',{'B5'},1,'A5');
xlswrite('result.xlsx',B5,1,'B5');

xlswrite('result.xlsx',{'R'},1,'A7');
xlswrite('result.xlsx',R,1,'B7');

xlswrite('result.xlsx',{'B'},1,'A13');
xlswrite('result.xlsx',B,1,'B13');




