% simulate forest fire with cellular automata
% zhou lvwen: zhou.lv.wen@gmail.com
% August 15 2010 

n = 300;
Plight = 5e-6; 
Pgrowth = 1e-2;
UL = [n 1:n-1]; % 左邻居
DR = [2:n 1]; %右邻居
veg=zeros(n,n);
% C = cat(dim, A, B) 沿 dim 指定的数组维度串联数组 A 和 B。dim 参数必须是正整数值。
imh = image(cat(3,veg,veg,veg));%veg分别为红绿蓝色
% veg = empty=0 burning=1 green=2
for i=1:3000
    %nearby fires? 四个邻居加起来看更加直观
    sum =            (veg(UL,:)==1) + ...
        (veg(:,UL)==1)     +      (veg(:,DR)==1) + ...
                     (veg(DR,:)==1);
% Tree=Tree-burning+new
    veg = 2*(veg==2) - ...
          ( (veg==2) & (sum>0 | (rand(n,n)<Plight)) ) + ...
          2*((veg==0) & rand(n,n)<Pgrowth) ;
     
    set(imh, 'cdata', cat(3,(veg==1),(veg==2),zeros(n)) )
    drawnow
end