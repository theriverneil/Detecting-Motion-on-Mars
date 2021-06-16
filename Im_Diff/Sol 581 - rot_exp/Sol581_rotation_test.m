I1 = imread('../../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
I2 = imread('../../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
[I1_up, I2_fixed_up] = Upsample(I1, I2);
I1_up = imrotate(I1_up, 0.026, 'crop');
imDiff_actual = int8(I1_up) - int8(I2_fixed_up);
imDiff_actual_rescaled = rescale(imDiff_actual,-1,1);

figure
subplot(1,2,1)
imagesc(imDiff_actual_rescaled - 0.22);
colorbar
greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
caxis([-0.05 0.05])
colormap(colorMap);
axis off

rotations = [0.025 0.026 0.027 0.028 0.029 0.03 0.031 0.032 0.033 0.034 0.035];
min_mse = realmax;
min_rotation = 0;
min_scale = 0;
for rotation_index = 1:length(rotations)
    I2_moving_up = imrotate(I2_fixed_up, rotations(rotation_index),'crop');
    imDiff_estimate = int8(I2_moving_up) - int8(I2_fixed_up);
    mse = immse(I1_up, I2_moving_up);
    if(mse < min_mse)
        min_mse = mse;
        min_rotation = rotations(rotation_index);
        min_scale = y_scales(scales_index);
    end
end

% output:
min_mse
min_rotation

I2_moving_up = imrotate(I2_fixed_up, min_rotation,'crop');
imDiff_estimate = int8(I2_moving_up) - int8(I2_fixed_up);
imDiff_estimate_rescaled = rescale(imDiff_estimate,-1,1);

subplot(1,2,2)
imagesc(imDiff_estimate_rescaled - 0.22);
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