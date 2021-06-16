function [dx, dy] = findMinimumCost(costs, searchSize)
[rowSize, columnSize] = size(costs);
min = 65537;
for i = 1:rowSize
    for j = 1:columnSize
        if (costs(i,j)<min)
            min = costs(i,j);
            dx = j; 
            dy = i;
        end
    end
end
if (costs(searchSize+1,searchSize+1) <= min) 
    dx = searchSize+1;
    dy = searchSize+1;
end
dy = dy-searchSize-1;
dx = dx-searchSize-1;




