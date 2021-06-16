load('upsampledES.mat','motionVect','mbSize','p','I2')
[row col] = size(I2);
mbCount = 1;
for i = 1:mbSize:row-mbSize+1
    for j = 1:mbSize:col-mbSize+1
        
        % dy is row(vertical) index
        % dx is col(horizontal) index
        % this means we are scanning in order
        
        dy = motionVect(1,mbCount);
        dx = motionVect(2,mbCount);
        Vx(i:i+mbSize-1,j:j+mbSize-1) = dx;
        Vy(i:i+mbSize-1,j:j+mbSize-1) = dy;
        mbCount = mbCount + 1;
    end
end
opflow = opticalFlow(Vx,Vy);
mag = opflow.Magnitude;
angle = rad2deg(opflow.Orientation);
figure
imshow(mag)
figure
imshow(angle)

