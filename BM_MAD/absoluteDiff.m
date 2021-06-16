function cost = absoluteDiff(I1_Blk,I2_Blk, n)
I1_Blk = double(I1_Blk);
I2_Blk = double(I2_Blk);
I1_Blk = I1_Blk-mean(I1_Blk, 'all');
I2_Blk = I2_Blk-mean(I2_Blk, 'all');
err = 0.0;
for i = 1:n
    for j = 1:n
        err = err+abs((I1_Blk(i,j)-I2_Blk(i,j)));
    end
end
cost = err/(n*n);

