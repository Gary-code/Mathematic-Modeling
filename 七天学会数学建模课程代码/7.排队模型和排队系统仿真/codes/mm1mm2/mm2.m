n = 100000; 
mu = 1; 
muB = 1.8;
tarr = cumsum(exprnd(mu,1,n));
tsrv = exprnd(muB,1,n);
tsta = zeros(1,n);%服务时刻
tlea = zeros(1,n);%离开时刻
twat = zeros(1,n);%等待时刻
last = [0 0];%服务台结束服务时刻
for i = 2:n
    [minemp, k] = min(last); %找出最快结束服务的服务台时刻
    tsta(i) = max(tarr(i),minemp);
    tlea(i) = tsta(i) + tsrv(i);
    last(k) = tlea(i);
    twat(i) = tlea(i) - tarr(i);
end
hist(twat)
sum(twat)/n
