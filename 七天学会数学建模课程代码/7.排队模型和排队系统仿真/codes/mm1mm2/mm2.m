n = 100000; 
mu = 1; 
muB = 1.8;
tarr = cumsum(exprnd(mu,1,n));
tsrv = exprnd(muB,1,n);
tsta = zeros(1,n);%����ʱ��
tlea = zeros(1,n);%�뿪ʱ��
twat = zeros(1,n);%�ȴ�ʱ��
last = [0 0];%����̨��������ʱ��
for i = 2:n
    [minemp, k] = min(last); %�ҳ�����������ķ���̨ʱ��
    tsta(i) = max(tarr(i),minemp);
    tlea(i) = tsta(i) + tsrv(i);
    last(k) = tlea(i);
    twat(i) = tlea(i) - tarr(i);
end
hist(twat)
sum(twat)/n
