n = 10; %��������?

% ��ÿ���˶����
Andre = 1; Betty = 2; Carol = 3; Dave  = 4; Ed    = 5;
Fanny = 6; Garth = 7; Hale  = 8; Ike   = 9; Jane  =10;

% ����ͼ�����ڽӾ���
A = zeros(10);
A(Andre, [Betty, Carol,  Dave, Fanny]) = 1;
A(Betty, [Andre,  Dave,    Ed, Garth]) = 1;
A(Carol, [Andre,  Dave, Fanny]) = 1;
A( Dave, [Andre, Betty, Carol,    Ed, Fanny, Garth]) = 1;
A(   Ed, [Betty,  Dave, Garth]) = 1;
A(Fanny, [Andre, Carol,  Dave, Garth,  Hale]) = 1;
A(Garth, [Betty,  Dave,    Ed, Fanny,  Hale]) = 1;
A( Hale, [Fanny, Garth,   Ike]) = 1;
A(  Ike, [ Hale,  Jane]) = 1;
A( Jane, [  Ike]) = 1;

Cd = degrees(A)' /(n-1)   % ���������ĶȲ��ұ�׼��.
Cc = closeness(A)*(n-1)   % ����ӽ����ĶȲ���׼��?.
