function [mag_img, phase_img] = obtainMagPhase(motionVect, mbSize, p, I2)
[row col] = size(I2);
mbCount = 1;
for i = 1:mbSize:row-mbSize+1
    for j = 1:mbSize:col-mbSize+1
        
        % dy is row(vertical) index
        % dx is col(horizontal) index
        % this means we are scanning in order
        
        dy = motionVect(1,mbCount);
        dx = motionVect(2,mbCount);
        mag_img(i:i+mbSize-1,j:j+mbSize-1) = sqrt(dx^2+dy^2);
        phase_img(i:i+mbSize-1,j:j+mbSize-1) = atan2(dy,dx);
        mbCount = mbCount + 1;
    end
end