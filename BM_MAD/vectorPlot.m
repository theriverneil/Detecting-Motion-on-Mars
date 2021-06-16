function vectorPlot(I2_up, motionVectors)    
    figure
    imshow(I2_up)
    hold on
    axis equal
    [X,Y] = meshgrid(1:128:size(I2_up,2),1:128:size(I2_up,1));
    U = reshape(motionVectors(1,:), 64, 64);
    V = reshape(motionVectors(2,:), 64, 64);
    quiver(X, Y, U(1:2:64,1:2:64), V(1:2:64,1:2:64),'Color','r')
end