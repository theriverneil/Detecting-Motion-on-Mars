I1 = imread('../../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569938EDR_F0000_2696M_.png');
I2 = imread('../../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569904EDR_F0000_2695M_.png');
% I1 = imread('../../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
% I2 = imread('../../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
[I1_up, I2_up] = Upsample(I1, I2);
I1_up = imrotate(I1_up, 0.026, 'crop');
figure
subplot(1,2,1)
imshow(I1_up(1450:2350,2200:4096))
subplot(1,2,2)
imshow(I2_up(1450:2350,2200:4096))
% [optimizer, metric] = imregconfig('monomodal');
% optimizer.MaximumIterations = 1000;
% I2_transform = imregtform(I2_up(1450:2350,2200:4096), I1_up(1450:2350,2200:4096), 'similarity', optimizer, metric,'DisplayOptimization', true, 'PyramidLevels', 1);
% save genTMatrix_affine.mat

% load genTMatrix_affine.mat
% if(isRigid(I2_transform))
%     I2_transform_rigid = rigid2d(I2_transform.T);
% end
% 
% imDiff_actual = int8(I1_up) - int8(I2_up);
% imDiff_actual_rescaled = rescale(imDiff_actual,-1,1);
% 
% figure
% subplot(2,1,1)
% imagesc(imDiff_actual_rescaled(1450:2350,2200:4096)- 0.08);
% colorbar
% % Create colormap that is green for negative, red for positive,
% % and a chunk inthe middle that is black.
% greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
% redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
% colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
% caxis([-0.05 0.05]) % change colorbar limits
% % Apply the colormap.
% colormap(colorMap);
% axis off
% 
% I2_up_transformed = imwarp(I2_up(1450:2350,2200:4096),I2_transform,'OutputView',imref2d(size(I1_up(1450:2350,2200:4096))));
% imDiff = int8(I2_up_transformed) - int8(I2_up(1450:2350,2200:4096));
% imDiff = rescale(imDiff,-1,1);
% subplot(2,1,2)
% imagesc(imDiff - 0.23);
% colorbar
% greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
% redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
% colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
% caxis([-0.05 0.05])
% colormap(colorMap);
% axis off
