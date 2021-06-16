% I1 = imread('I1.png');
% I2 = imread('I2.png');
% I1_up = I1(:,1:1550);
% I2_up = I2(:,1:1550);
% figure
% subplot(2,1,1)
% imshow(I1_up)
% subplot(2,1,2)
% imshow(I2_up)
% [optimizer, metric] = imregconfig('monomodal');
% optimizer.MaximumIterations = 1000;
% I2_transform = imregtform(I2_up, I1_up, 'similarity', optimizer, metric,'DisplayOptimization', true, 'PyramidLevels', 1);
% save genTMatrix_affine.mat

load genTMatrix_affine.mat
if(isRigid(I2_transform))
    I2_transform_rigid = rigid2d(I2_transform.T);
end

imDiff_actual = int8(I1_up) - int8(I2_up);
imDiff_actual_rescaled = rescale(imDiff_actual,-1,1);

figure
subplot(2,1,1)
imagesc(imDiff_actual_rescaled);
colorbar
% Create colormap that is green for negative, red for positive,
% and a chunk inthe middle that is black.
greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
caxis([-0.05 0.05]) % change colorbar limits
% Apply the colormap.
colormap(colorMap);
axis off

I2_up_transformed = imwarp(I2_up,I2_transform,'OutputView',imref2d(size(I1_up)));
imDiff = int8(I2_up_transformed) - int8(I2_up);
imDiff = rescale(imDiff,-1,1);
subplot(2,1,2)
imagesc(imDiff);
colorbar
greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
caxis([-0.05 0.05])
colormap(colorMap);
axis off
