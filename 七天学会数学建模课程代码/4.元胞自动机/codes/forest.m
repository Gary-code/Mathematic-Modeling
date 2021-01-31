% simulate forest fire with cellular automata
% zhou lvwen: zhou.lv.wen@gmail.com
% August 15 2010 

n = 300;
Plight = 5e-6; 
Pgrowth = 1e-2;
UL = [n 1:n-1]; % ���ھ�
DR = [2:n 1]; %���ھ�
veg=zeros(n,n);
% C = cat(dim, A, B) �� dim ָ��������ά�ȴ������� A �� B��dim ����������������ֵ��
imh = image(cat(3,veg,veg,veg));%veg�ֱ�Ϊ������ɫ
% veg = empty=0 burning=1 green=2
for i=1:3000
    %nearby fires? �ĸ��ھӼ�����������ֱ��
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