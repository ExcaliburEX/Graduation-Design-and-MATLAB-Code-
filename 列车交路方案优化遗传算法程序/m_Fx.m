function y=m_Fx(x, OD)
%% 要求解的函数
%% Z = Q1 * t1d + Q2 * t2d
    y = (sum(sum(OD)) - sum(sum(OD(x(1):x(2),x(1):x(2))))) * (30/x(3)) + sum(sum(OD(x(1):x(2),x(1):x(2)))) * (30/(x(3)+x(4)));
end