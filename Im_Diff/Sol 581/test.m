I1 = imread('../../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118676EDR_F0000_0678M_.png');
I2 = imread('../../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118644EDR_F0000_0677M_.png');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
[I1_up, I2_up] = Upsample(I1, I2);
I2_up_transformed = imrotate(I2_up(1420:2200,1:3486),-0.02,'crop');

imDiff_actual = int8(I1_up) - int8(I2_up);
imDiff_actual_rescaled = rescale(imDiff_actual,-1,1);

figure
imagesc(imDiff_actual_rescaled(1420:2200,1:3486) + 0.125);
colorbar
% Create colormap that is green for negative, red for positive,
% and a chunk inthe middle that is black.
greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
caxis([-0.05 0.05]) % change colorbar limits
% Apply the colormap.
colormap(colorMap);

imDiff = int8(I2_up_transformed) - int8(I2_up(1420:2200,1:3486));
imDiff = rescale(imDiff,-1,1);
figure
imagesc(imDiff - 0.65);
colorbar
greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
caxis([-0.05 0.05])
colormap(colorMap);
