I1 = imread('../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569938EDR_F0000_2696M_.png');
I2 = imread('../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569904EDR_F0000_2695M_.png');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
[I1_up, I2_fixed_up] = Upsample(I1, I2);

imDiff_actual = int8(I1_up) - int8(I2_fixed_up);
imDiff_actual_rescaled = rescale(imDiff_actual,-1,1);

figure
imagesc(imDiff_actual_rescaled(1400:2400,:) - 0.0725);
colorbar
% Create colormap that is green for negative, red for positive,
% and a chunk inthe middle that is black.
greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
caxis([-0.05 0.05]) % change colorbar limits
% Apply the colormap.
colormap(colorMap);

I2_moving_up = imrotate(I2_fixed_up, 5);
I2_moving_up = imresize(I2_moving_up, [(4096 + 5) 4096]);
imDiff_estimate = int8(I2_moving_up(1400:2400,:)) - int8(I2_fixed_up(1400:2400,:));
imDiff_estimate_rescaled = rescale(imDiff_estimate,-1,1) - 0.01;

figure
imagesc(imDiff_estimate_rescaled);
colorbar
% Create colormap that is green for negative, red for positive,
% and a chunk inthe middle that is black.
greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
caxis([-0.05 0.05]) % change colorbar limits
% Apply the colormap.
colormap(colorMap);