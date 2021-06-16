function motionVectors = exhaustiveSearchBM(I1, I2, blockSize, searchSize)
[rowSize columnSize] = size(I2);
motionVectors = zeros(2, rowSize*columnSize/blockSize^2);
costs = ones(2*searchSize+1, 2*searchSize+1)*65537;
count = 1;
for i = 1:blockSize:rowSize-blockSize+1
    for j = 1:blockSize:columnSize-blockSize+1   
        for y = -searchSize:searchSize        
            for x = -searchSize:searchSize
                I1_Blk_y = i+y;
                I1_Blk_x = j+x;
                if ( I1_Blk_y<1 || I1_Blk_y+blockSize-1>rowSize || I1_Blk_x<1 || I1_Blk_x+blockSize-1>columnSize)
                    continue;
                end
                costs(y+searchSize+1,x+searchSize+1) = absoluteDiff(I1(i:i+blockSize-1,j:j+blockSize-1), I2(I1_Blk_y:I1_Blk_y+blockSize-1, I1_Blk_x:I1_Blk_x+blockSize-1), blockSize);         
            end
        end
        [dx, dy] = findMinimumCost(costs, searchSize);
        motionVectors(1,count) = dy; 
        motionVectors(2,count) = dx;    
        count = count + 1;
        costs = ones(2*searchSize + 1, 2*searchSize +1) * 65537;
    end
end
                    