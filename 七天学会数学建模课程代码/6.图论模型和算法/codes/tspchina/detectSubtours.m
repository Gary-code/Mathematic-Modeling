
function subTours = detectSubtours(x,idxs)
% ��������;Ԫ�����飬��ͼ�е���Ȧ
 
x = round(x); % ������ȷ�е�����
r = find(x);
substuff = idxs(r,:); % �����ߵĽڵ��
unvisited = ones(length(r),1); % ����δ���ʵ�����
curr = 1; % �������۵�����;
startour = find(unvisited,1); % ��һ��δ���ʵ�����
while ~isempty(startour)
    home = substuff(startour,1);
    nextpt = substuff(startour,2);
    visited = nextpt;
    unvisited(startour) = 0;
    
    while nextpt ~= home
        % ����nextptΪ��������
        [srow,scol] = find(substuff == nextpt);
        
        % ȷ����Ӧ���еĽڵ�
        trow = srow(srow ~= startour);
        scol = 3-scol(trow == srow); % 1��2��2��1
        startour = trow;
        nextpt = substuff(startour,scol); % ����;����һ�ڵ�λ��
        
        visited = [visited,nextpt]; % ���ڵ��������;
        unvisited(startour) = 0; % ���·��ʹ���λ��
    end
    subTours{curr} = visited; % �����ҵ�������;
    
    curr = curr + 1;
    startour = find(unvisited,1);
end
end
