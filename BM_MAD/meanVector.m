load upsampledES.mat
% mu = mean(motionVect,2);
mu = zeros(2,1);
j = 0;
for i = 1:length(motionVect)
    if(motionVect(1,i) ~= 0 || motionVect(2,i) ~= 0)
        j = j + 1;
        mu = mu + motionVect(:,i);    
    end
end
mu = mu./j;
figure
imshow(I2_up)
hold on
axis equal
[X,Y] = meshgrid(1:128:size(I2_up,2),1:128:size(I2_up,1));
motionVect = motionVect(1:2,:) - mu;
U = reshape(motionVect(1,:), 32, 32);
V = reshape(motionVect(2,:), 32, 32);
quiver(X, Y, U, V,'Color','r')