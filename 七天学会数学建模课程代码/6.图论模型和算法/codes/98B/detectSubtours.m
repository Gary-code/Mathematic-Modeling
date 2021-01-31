
function subTours = detectSubtours(x,idxs)
% 返回子旅途元胞数组，即图中的子圈
 
x = round(x); % 纠正不确切的整数
r = find(x);
substuff = idxs(r,:); % 旅行线的节点对
unvisited = ones(length(r),1); % 跟踪未访问的旅行
curr = 1; % 正在评价的子旅途
startour = find(unvisited,1); % 第一个未访问的旅行
while ~isempty(startour)
    home = substuff(startour,1);
    nextpt = substuff(startour,2);
    visited = nextpt;
    unvisited(startour) = 0;
    
    while nextpt ~= home
        % 找以nextpt为起点的旅行
        [srow,scol] = find(substuff == nextpt);
        
        % 确定相应旅行的节点
        trow = srow(srow ~= startour);
        scol = 3-scol(trow == srow); % 1变2，2变1
        startour = trow;
        nextpt = substuff(startour,scol); % 子旅途的下一节点位置
        
        visited = [visited,nextpt]; % 将节点加入子旅途
        unvisited(startour) = 0; % 更新访问过的位置
    end
    subTours{curr} = visited; % 保存找到的子旅途
    
    curr = curr + 1;
    startour = find(unvisited,1);
end
end
