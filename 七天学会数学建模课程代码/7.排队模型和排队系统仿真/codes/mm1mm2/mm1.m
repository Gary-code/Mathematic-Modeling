n = 100000;  %模拟顾客数量
mu = 1; muA = 0.9; %到达率和服务率
tarr = cumsum(exprnd(mu,1,n));% 到达时刻（指数分布）
tsrv = exprnd(muA,1,n);%服务时间长度
tsta = zeros(1,n);%初始化服务时刻
tlea = zeros(1,n);%初始化离开的时刻
twat = zeros(1,n);%初始化等待时长
tsta(1) = tarr(1);%首位顾客服务时刻=到达时刻
tlea(1) = tsta(1) + tsrv(1);%首位顾客离开时刻
twtime(1) = tlea(1) - tarr(1);%首位顾客等待时长
for i = 2:n
    %服务时刻=max{到达时刻，上一个顾客离开时刻}
    tsta(i) = max(tarr(i),tlea(i-1));
    tlea(i) = tsta(i) + tsrv(i);% 离开时刻=服务时刻+服务时长
    twat(i) = tlea(i) - tarr(i);% 等待时长=离开时刻-到达时刻
end
hist(twat)
sum(twat)/n
