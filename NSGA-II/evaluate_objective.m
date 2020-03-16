function f = evaluate_objective(x, M, V)%%����ÿ�������M��Ŀ�꺯��ֵ
% f = [];
% 
% g = 1;
% sum = 0;
% for i = 2:V
%     sum = sum + x(i);
% end
% sum = 9*(sum / (V-1));
% f(1) = exp(sqrt(x(1)+sum));
% g = g + sum;
% f(2) = g * (1 - sqrt(x(1) / g));

x_i1 = e_1 / 72;
x_i2 = e_2 / 92;
x_i3 = e_3 / 80;
f(1) =   20 * (1 + 0.15 * (x(1) / e_1) ^ 0.4)...
          +   30 * (1 + 0.15 * (x(2) / e_2) ^ 0.4)...
          +   20 * (1 + 0.15 * (x(3) / e_3) ^ 0.4);
f(2) = (10 * (1 - 0.5 ) ^ 2) / (2 * (1 - 0.5 * x_i1)) ...
           + (x_i1 ^ 2) / (2 * x(1) * (1 - x_i1))...
           -  0.65 * ((10 / (x(1) ^ 2)) ^ (1/3)) * (x_i1 ^ (2 + 5 * x_i1))...
           + (10 * (1 - 0.5 ) ^ 2) / (2 * (1 - 0.5 * x_i2)) ...
           + (x_i2 ^ 2) / (2 * x(2) * (1 - x_i2))...
           -  0.65 * ((10 / (x(2) ^ 2)) ^ (1/3)) * (x_i2 ^ (2 + 5 * x_i2))...
           + (10 * (1 - 0.5 ) ^ 2) / (2 * (1 - 0.5 * x_i3)) ...
           + (x_i3 ^ 2) / (2 * x(3) * (1 - x_i3))...
           -  0.65 * ((10 / (x(3) ^ 2)) ^ (1/3)) * (x_i3 ^ (2 + 5 * x_i3));
end