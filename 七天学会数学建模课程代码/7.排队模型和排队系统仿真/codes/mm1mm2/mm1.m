n = 100000;  %ģ��˿�����
mu = 1; muA = 0.9; %�����ʺͷ�����
tarr = cumsum(exprnd(mu,1,n));% ����ʱ�̣�ָ���ֲ���
tsrv = exprnd(muA,1,n);%����ʱ�䳤��
tsta = zeros(1,n);%��ʼ������ʱ��
tlea = zeros(1,n);%��ʼ���뿪��ʱ��
twat = zeros(1,n);%��ʼ���ȴ�ʱ��
tsta(1) = tarr(1);%��λ�˿ͷ���ʱ��=����ʱ��
tlea(1) = tsta(1) + tsrv(1);%��λ�˿��뿪ʱ��
twtime(1) = tlea(1) - tarr(1);%��λ�˿͵ȴ�ʱ��
for i = 2:n
    %����ʱ��=max{����ʱ�̣���һ���˿��뿪ʱ��}
    tsta(i) = max(tarr(i),tlea(i-1));
    tlea(i) = tsta(i) + tsrv(i);% �뿪ʱ��=����ʱ��+����ʱ��
    twat(i) = tlea(i) - tarr(i);% �ȴ�ʱ��=�뿪ʱ��-����ʱ��
end
hist(twat)
sum(twat)/n
