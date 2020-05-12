Mu = 26;
sigma = 10;
N = round(normrnd(Mu, sigma, [35 35]));
N = N + abs(min(N));
sum(sum(N))
if sum(sum(N)) > 35000 ;
    if sum(sum(N)) < 40000;
        xlswrite('test.xlsx',N,'Sheet1')
    end
end