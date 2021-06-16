load images.mat
k = 1;
for i=1:length(Images)
    for j=(i+1):length(Images)
        tic
        I1 = imread(sprintf('../../../Insight Images/PNG/Sol 96/%s.png', Images(j)));
        I2 = imread(sprintf('../../../Insight Images/PNG/Sol 96/%s.png', Images(i)));
        I1 = rgb2gray(I1);
        I2 = rgb2gray(I2);
        [I1_up, I2_up] = Upsample(I1, I2);
        % figure
        % imshow(I1_up(1600:3200,1:1150))
        % figure
        % imshow(I2_up(1600:3200,1:1150))
        [optimizer, metric] = imregconfig('monomodal');
        optimizer.MaximumIterations = 1000;
        T = affine2d;
        I2_transform = imregtform(I2_up(1600:3200,1:1150), I1_up(1600:3200,1:1150), 'similarity', optimizer, metric,'DisplayOptimization',true,'InitialTransformation', T, 'PyramidLevels', 1);
        writematrix(I2_transform.T,sprintf('%d.csv',k));
        save genTMatrix_affine.mat
        toc
        k = k + 1;
    end
end

% I1 = imread(sprintf('../../../Insight Images/PNG/Sol 96/%s.png', "_mars.nasa.gov_insight-raw-images_surface_sol_0096_idc_D000M0096_605054391EDR_F0000_2696M_"));
% I2 = imread(sprintf('../../../Insight Images/PNG/Sol 96/%s.png', "_mars.nasa.gov_insight-raw-images_surface_sol_0096_idc_D000M0096_605054344EDR_F0000_2695M_"));
% I1 = rgb2gray(I1);
% I2 = rgb2gray(I2);
% [I1_up, I2_up] = Upsample(I1, I2);
% % figure
% % imshow(I1_up(1600:3200,1:1150))
% % figure
% % imshow(I2_up(1600:3200,1:1150))
% [optimizer, metric] = imregconfig('monomodal');
% optimizer.MaximumIterations = 1000;
% T = affine2d;
% I2_transform = imregtform(I2_up(1600:3200,1:1150), I1_up(1600:3200,1:1150), 'similarity', optimizer, metric,'DisplayOptimization',true,'InitialTransformation', T, 'PyramidLevels', 1);

% load genTMatrix_affine.mat
% if(isRigid(I2_transform))
%     I2_transform_rigid = rigid2d(I2_transform.T);
% end
% 
% imDiff_actual = int8(I1_up) - int8(I2_up);
% imDiff_actual_rescaled = rescale(imDiff_actual,-1,1);
% 
% figure
% imagesc(imDiff_actual_rescaled(1600:3200,1:1150) - 0.03);
% colorbar
% % Create colormap that is green for negative, red for positive,
% % and a chunk inthe middle that is black.
% greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
% redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
% colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
% caxis([-0.05 0.05]) % change colorbar limits
% % Apply the colormap.
% colormap(colorMap);
% 
% I2_up_transformed = imwarp(I2_up(1600:3200,1:1150),I2_transform,'OutputView',imref2d(size(I1_up(1600:3200,1:1150))));
% imDiff = int8(I2_up_transformed) - int8(I2_up(1600:3200,1:1150));
% imDiff = rescale(imDiff,-1,1);
% figure
% imagesc(imDiff - 0.91);
% colorbar
% greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
% redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
% colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
% caxis([-0.05 0.05])
% colormap(colorMap);
